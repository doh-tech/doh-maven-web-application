def BuildNumber = BUILD_NUMBER

pipeline{
    
    
    
    agent any
    
    tools{
        maven "maven3.9.4"
    }
    
    stages{
    
      stage("Git downloading The Code "){
          steps{
             git branch: 'development', credentialsId: 'cc2dc07f-04dd-4250-8fb4-343f97ae5933', url: 'https://github.com/doh-tech/doh-java-web-app-docker.git' 
          }
      }  
      stage("Buiding The Code"){
          steps{
              sh "mvn clean package"
          }
      }
      stage("Creating Docker Image"){
          steps{
            sh "docker build -t doh1/java-web-app:${BuildNumber}  ."  
          }
      }
      stage("Pushing image Into DockerHub"){
          steps{
              withCredentials([string(credentialsId: 'Docker_HUb', variable: 'Docker_Hub')]) {
           sh "docker login -u doh1 -p ${Docker_Hub}"
           }
           sh "docker push doh1/java-web-app:${BuildNumber}"   
          }
      }
      stage("Creating Docker Container"){
          steps{
          
              sh "docker run --name doh -p 7777:8080 -d doh1/java-web-app:${BuildNumber}"
          }
      }
        
        
        
        
        

        
   }//stages clossing
   }//pipeline closing
