properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([githubPush()])])
@Library("jenkinslibrary") _
pipeline{
    agent any
     
     tools{
         maven "maven3.9.5"
         
     }
    stages{
        
        stage("Git Checkout"){
            steps{
              sendSlackNotifications('STARTED')   
            git branch: 'development', credentialsId: '72e559b7-e635-4226-9a20-2eadbb1d91c8', url: 'https://github.com/doh-tech/doh-maven-web-application.git'    
            }
        }
        stage("Creating Package"){
            steps{
                sh "mvn package"
            }
        }
       /*
        stage("Executing Sonargube Report"){
            steps{
                sh "mvn sonar:sonar"
            }
        }
        stage("Offloading Artifact Into Nexus "){
            steps{
                sh "mvn deploy"
            }
        }
     */ 
        
}//clossing stage
post {
  success {
       sendSlackNotifications(currentBuild.result)

  }
  failure {
       sendSlackNotifications(currentBuild.result)

  }
}

}//clossing pipeline
