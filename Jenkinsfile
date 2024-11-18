pipeline {
    agent any
    environment {
      MAVEN_ARGS=" -e clean install"
  }
    stages {
        stage('build') {
            steps {
               withMaven(maven: 'MAVEN_ENV') {
                    sh 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64'
                    sh 'export PATH=$JAVA_HOME/bin:$PATH'
                    sh "mvn ${MAVEN_ARGS}"
            }
            }
        }
        stage('docker-compose start') {
             steps {
               sh 'docker-compose up -d'
              }
        }
    }
}