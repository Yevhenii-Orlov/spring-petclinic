properties([pipelineTriggers([githubPush()])])

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

    stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install'
            }
    }

    stage ('Restart service') {
            steps {
          /*  sh '''sudo cp ./service/spring-petclinic-2.4.5.service /etc/systemd/system/spring-petclinic-2.4.5.service
                  sudo cp ./service/spring-petclinic-2.4.5.sh /usr/local/bin/spring-petclinic-2.4.5.sh
                  sudo chmod +x /usr/local/bin/spring-petclinic-2.4.5.sh
                  /usr/local/bin/./spring-petclinic-2.4.5.sh start'''*/
              sh 'sudo systemctl restart spring-petclinic-2.4.5.service'
    }

  }
}
}
