pipeline {
    agent any 
    stages{
    stage('checkout the git repo') {
      steps {
        git 'https://github.com/arunkumargowda3/staragile.git'
      }
    }
    }
    stage('maven clean package'){
      step{
        sh 'mvn clean package'
      }
    }
}
