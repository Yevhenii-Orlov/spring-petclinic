pipeline {
  
  agent { label 'java' }
  
  tools {
    maven 'Maven3'
    jdk 'jdk8'
  } 
  
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Yevhenii-Orlov/spring-petclinic.git'
      }
    }
    stage('Compile') {
       steps {
         sh 'mvn compile' //only compilation of the code
       }
    }
    }
}
