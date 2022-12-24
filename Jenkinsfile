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
    

    //stage('stopping running containers') {

    //steps {
     //sh 'docker stop $(docker ps --filter status=running -q)'
   // }
  // }
   //stage('removing stopped containers') {

   //steps {
     // sh 'docker rm $(docker ps --filter status=exited -q)'
   // }
  // }
   //stage('removing the images') {

   // steps {
    //  sh 'docker rmi -f $(docker images -q)'
  //  }
 //  }

   stage('Build') {

			steps {
				sh 'docker build -t arunkumarkn/war_test_docker:latest .'
			}
		}
    stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin' //docker login -u arunkumarkn -p

			}
    }
    stage('Push') {

			steps {
				sh 'docker push arunkumarkn/war_test_docker:latest'
			}
		}
    stage('deploy') {
      steps {

        sh 'docker run -itd -p 8030:8080 arunkumarkn/war_test_docker:latest'
      }
    }
    

  }
  post {
		always {
			sh 'docker logout'
		}
	}
	
}
