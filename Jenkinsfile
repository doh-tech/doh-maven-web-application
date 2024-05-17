properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2')), pipelineTriggers([githubPush()])])

pipeline{
    
    agent any
    tools{
        maven 'maven3.9.6'
    }
    
    stages{
        stage("Git Clone"){
            steps{
                slacknotification('STARTED')
         git branch: 'development', credentialsId: '31051bde-338c-42fc-bbe2-f3ad7c0cc382', url: 'https://github.com/doh-tech/doh-maven-web-application.git'            
         }
        }
    
    stage("Creating Artifact"){
        steps{
            sh "mvn package"
        }
    }
}//clossing stage
post {
  success {
   slacknotification(currentBuild.result)
  }
  failure {
    slacknotification(currentBuild.result)
  }
}

}// clossing pipeline

def slacknotification(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary, channel: "#cvs_project")
}
