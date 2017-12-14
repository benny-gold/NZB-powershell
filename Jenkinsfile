pipeline {
  agent {
    label 'windows'
  }
  stages {
          stage('Get Environment Info') {
      steps {
        powershell '$PSVersionTable'
      }
    }
          stage('Get Secrets') {
      steps {
        powershell 'Copy-Item C:\Git\Repos\NZB-powershell\secrets.ps1 -destination .\secrets.ps1
        Copy-Item -path C:\Git\Repos\NZB-powershell\secrets.ps1 -destination .\powershell-notifications\secrets.ps1
         '
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
}