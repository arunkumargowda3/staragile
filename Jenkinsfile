pipeline {
    agent any 
    stages{
    stage('checkout the project') {
      steps {
        git 'https://github.com/arunkumargowda3/staragile.git'
        sh 'mvn clean pakage'
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
