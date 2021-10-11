pipeline {
    agent any

    environment {
        tf-packer = credentials ('tf-packer')
        aws_credentials = credentials ('aws_credentials')
    }

    stages {
        stage('CONVERT INFRASTRUCTURE FILE TO EXECUTABLE') {
            steps {
                sh 'chmod -x create_infrastructure.sh'  
            }
        }

        stage('RUN INFRASTRUCTURE BASH SCRIPT') {
            steps {
                sh './create_infrastructure.sh'
           }
        }  
    }
}


