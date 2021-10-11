pipeline {
    agent any

    environment {
        
        packer_secret_text = credentials() ('packer_secret_text')
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


