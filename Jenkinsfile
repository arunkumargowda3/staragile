pipeline {
    agent any 
    stages{
    stage('checkout the project') {
      steps {
        git 'https://github.com/arunkumargowda3/staragile.git'
        sh 'mvn clean package'
    }
    }
	    stage('docjerbu image') {
		    steps{
			    sh 'docker build -t arunkumarkn/adressbook234 .'
			    sh 'docker login -u arunkumarkn -p A960610j@'
			    sh 'docker push arunkumarkn/adressbook234'
		    }
	    }
    }
	    post{
		    success{
			    slackSend channel: 'jenkinsproject', message: 'build is success'
		    }
		    failure{
			    slackSend channel: 'jenkinsproject', message: 'build is build fail'
		    }
		    
	    }
	
}
