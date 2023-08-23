properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM(ignorePostCommitHooks: true, scmpoll_spec: '* * * * *')])])

pipeline{
    
    agent any
   
    tools{
        maven "maven3.9.4"
    }
    
    
    stages{
        
        stage("Downlaoding The Code"){
            steps{
            git branch: 'development', credentialsId: 'cc2dc07f-04dd-4250-8fb4-343f97ae5933', url: 'https://github.com/doh-tech/doh-maven-web-application.git'
            }
        }
        stage("Building The Code"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Running SonarGube Report"){
            steps{
                sh "mvn sonar:sonar"
            }
        }
        stage("Ofloading Into Nexus"){
            steps{
                sh "mvn clean deploy"
            }
        }
        
    
        
        
        
        
        
        
    }//clossing stages
    }//stage
