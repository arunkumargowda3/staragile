node{
    stage('git clone'){
        git 'https://github.com/arunkumargowda3/staragile.git'
    }
    stage('mv package'){
        sh 'mvn clean package'
    }
    //stage('sonarqube'){
       // withSonarQubeEnv(installationName: 'sonarqube' , credentialsId: 'sonarqube_token') {
        //    sh 'mvn package sonar:sonar'
       // }
   // }
    stage('removing the images') {
       sh 'docker rmi -f $(docker images -q)'
    }
    stage('docker build and push'){
        sh 'docker build -t arunkumarkn/prajwalimages:latest .'
    }
    stage('docker push'){
        withCredentials([string(credentialsId: 'dockerhub_correct', variable: 'docker_hub')]) {
        //withCredentials([string(credentialsId: 'docker_hub_login', variable: 'dockerlog')]) {
           // sh('curl -u arunkumarkn:$dockerlog https://hub.docker.com')
           sh 'docker login -u arunkumarkn -p ${docker_hub}'
        }
    }
    stage('dockerpushimages'){
        sh 'docker push arunkumarkn/prajwalimages:latest'
		sh 'docker logout'
    }
    post{
        success{
            slackSend channel: 'jenkinsproject', message: 'build is success'
    }
    }
    
}
//sh 'docker push arunkumarkn/war_test_docker:latest'
