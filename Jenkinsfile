pipeline {
    agent any 
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_cred')  //docker login passwrdand username
	}
    stages{
    stage('checkout the project') {
      steps {
        git 'https://github.com/arunkumargowda3/staragile.git'
        sh 'mvn clean package'
    }
    }
	    post{
		    success{
			    slackSend channel: 'jenkinsproject', message: 'build is success'
		    }
	    }
	
}
