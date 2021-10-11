pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('tf-packer-key')
        aws_credentials = credentials ('aws_credentials')
        ACCESS_KEY = credentials ('ACCESS_KEY')
        SECRET_KEY = credentials ('SECRET_KEY')
    }

    stages {
        stage('CONVERT INFRASTRUCTURE FILE TO EXECUTABLE') {
            steps {
                sh 'ls'
                sh 'chmod -x create_infrastructure.sh'  
            }
        }

        stage('RUN INFRASTRUCTURE BASH SCRIPT') {
            steps {
                sh 'sh create_infrastructure.sh'
           }
        }  
    }
}

