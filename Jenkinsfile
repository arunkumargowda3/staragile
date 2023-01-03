pipeline {
    agent any 
    stages{
    stage('checkout the git repo') {
      steps {
        git 'https://github.com/arunkumargowda3/staragile.git'
      }
    }
    stage('maven clean package'){
      steps{
        sh 'mvn clean package'
      }
    }
    stage('build Docker Images') {
      steps {
          sh ' docker build -t arunkumarkn/addressbook .'
      }
    }
    //stage('docker login and push image to docker hub'){
      //  steps {
        //withCredentials([usernamePassword(credentialsId: 'docker_hub_passwd', passwordVariable: 'docker_passwd_var', usernameVariable: 'docker_username_var')]) {
          //  sh 'docker login -u ${docker_username_var} -p ${docker_passwd_var}'
            //sh 'docker push arunkumarkn/addressbook'
            //}
        //}
    //}
    stage('configure and deploying to ansible server') {
      steps {
        ansiblePlaybook credentialsId: 'ansible_server', disableHostKeyChecking: true, installation: 'ansible_server', inventory: 'myhosts.inv', playbook: 'deployserver.yml'
        }
    }
    }
        
       post {
          success {
            emailext body: "${env.BUILD_URL} has result ${currentBuild.result}", recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: "Status of pipeline: ${currentBuild.fullDisplayName}"
        }
         failure {
            emailext body: "${env.BUILD_URL} has result ${currentBuild.result}", recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: "Status of pipeline: ${currentBuild.fullDisplayName}"
        }
       }
}
