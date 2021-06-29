pipeline {
    agent { label 'java' }
       
    stages {
        stage('Build') {
            steps {
                git url: 'https://github.com/Yevhenii-Orlov/spring-petclinic'
                withMaven {
                    sh "mvn clean verify"
                }                  // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}
