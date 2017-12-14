pipeline {
  agent {
    label 'windows'
  }
  stages {
        stage('Clean Workspace') {
            steps{
                step([$class: 'WsCleanup', cleanWhenSuccess: false, notFailBuild: true])
            }
        }
          stage('Get Environment Info') {
      steps {
        powershell '$PSVersionTable'
      }
    }
          stage('Get Secrets') {
      steps {
        powershell 'Copy-Item C:\\Git\\Repos\\NZB-powershell\\secrets.ps1 -destination .\\secrets.ps1;     Copy-Item -path C:\\Git\\Repos\\NZB-powershell\\secrets.ps1 -destination .\\powershell-notifications\\secrets.ps1'
      }
    }
    stage('Run Tests') {
      steps {
        powershell 'Invoke-Pester -OutputFormat NUnitXml -OutputFile Tests.xml'
      }
    }

    stage('Update Module Manifest') {
      steps {
        powershell 'gci'
      }
    }
  }
      post {
        always {
            echo 'Build Finished!'
        }
        success {
            script {           
                def color = '#6600ff'
                def msg = "Build Successful: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"
                slackSend(color: color, message: msg)   
            }
        }
        failure {
            script {
                def color = '#cc0066'
                def msg = "Build Failed: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"
                slackSend(color: color, message: msg)
            }
        }
    }
}