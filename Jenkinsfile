pipeline {
  agent none
  stages {
        stage ('Spin up Docker Environment') {
        agent {
    label 'docker-qa'
  }
  steps {
    cleanWs notFailBuild: true
    checkout scm
    sh 'env'
    sh 'hostname'
    sh 'docker --version'
    sh 'cd ./docker/NZBTests && docker-compose up -d'
  }
    }
    stage('Get Environment Info') {
        agent {
    label 'windows'
  }
      steps {
        powershell '$PSVersionTable'
        powershell 'Get-ChildItem -recurse'
        powershell '$MyInvocation.MyCommand.Path'
        powershell '[Environment]::Is64BitProcess'
        powershell 'Get-Variable -Name env*'
      }
    }
    stage('Get Secrets') {
        agent {
    label 'windows'
  }
      steps {
        powershell 'Copy-Item C:\\Git\\Repos\\NZB-powershell\\docker\\secrets.ps1 -destination .\\secrets.ps1;     Copy-Item -path C:\\Git\\Repos\\NZB-powershell\\docker\\secrets.ps1 -destination .\\powershell-notifications\\secrets.ps1'
      }
    }
    stage('Run Tests') {
        agent {
    label 'windows'
  }
      steps {
        bat '"C:\\Windows\\SysNative\\WindowsPowerShell\\v1.0\\Powershell.exe" -ExecutionPolicy ByPass -noprofile -command "Invoke-Pester -OutputFormat NUnitXml -OutputFile .\\$($env:BUILD_NUMBER)_Tests.xml"'
        nunit failIfNoResults: true, testResultsPattern: "**/${env.BUILD_NUMBER}_Tests.xml"
      }
    }
    stage('Update Module Manifest') {
        agent {
    label 'windows'
  }
      when {
        branch 'master'
      }
      steps {
        powershell 'New-ModuleManifest -RootModule "$psscriptroot\\NZB-Powershell.psm1" -ModuleVersion "2.0.0.$(106+$env:BUILD_NUMBER)" -Guid "fef43043-7d3b-4ad5-9a7c-6478aba9a102" -Author "Ben Gould" -Copyright "2017 Ben Gould. All rights reserved." -PowerShellVersion 4.0 -FunctionsToExport * -VariablesToExport * -Path NZB-Powershell.psd1 -CmdletsToExport * -ScriptsToProcess @("$PSScriptRoot\\secrets.ps1", "$PSScriptRoot\\Classes.ps1") -CompanyName "Choffins Ltd."'
      }
    }
    stage('Clean Up') {
        agent {
    label 'windows'
  }
      steps {
        archiveArtifacts(artifacts: '**', allowEmptyArchive: true, onlyIfSuccessful: true)
      }
    }
  }
  environment {
    moduleGuid = '9b63ed1f-0459-4d44-9df6-d07c69be0895'
  }
  post {
    always {
      echo 'Build Finished!'
      node ('docker-qa'){
        sh 'cd ./docker/NZBTests && docker-compose down'
      }
    }
    success {
      script {
        def status = 'Jobs a goodun'
        def color = '#6600ff'
        def msg = "Build Successful: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"
        slackSend(color: color, message: msg)
      }
      
      
    }
    
    failure {
      script {
        def status = 'Jobs a baddie'
        def color = '#cc0066'
        def msg = "Build Failed: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"
        slackSend(color: color, message: msg)
      }
      
      
    }
    
  }
}
