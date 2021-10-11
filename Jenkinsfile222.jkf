pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = credentials ('AWS_DEFAULT_REGION')
        ACCESS_KEY = credentials ('ACCESS_KEY')
        SECRET_KEY = credentials ('SECRET_KEY')
    }

    stages {
        stage('Build VPC.') {
            steps {
           withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: ''), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: ''), string(credentialsId: 'AWS_DEFAULT_REGION', variable: '')]) {
           sh 'cd vpc-module && terraform init && /usr/local/bin/terraform apply -var-file=vpc.tfvars --auto-approve'
            }           
            }
        }
        stage('Build AMI') {
            steps {
                withCredentials([string(credentialsId: 'ACCESS_KEY', variable: ''), string(credentialsId: 'SECRET_KEY', variable: ''), string(credentialsId: 'AWS_DEFAULT_REGION', variable: '')]) {
                 sh 'ls'
                 sh 'cd packer && ls && export PACKER_LOG=1 && export PACKER_LOG_PATH=$WORKSPACE/packer.log && echo "packer log path:" $PACKER_LOG_PATH && /usr/bin/packer build master_linux.json &&  /usr/bin/packer build agent_linux.json'
                }
           }
        }
        stage('Create Broker Node') {
            steps {
                sh 'cd server && ls && cd Kafka-broker-node && ls && terraform init && terraform apply -var-file=toolbox1.tfvars --auto-approve'
            }
        }
        stage('Create Zookeeper Node') {
            steps {
                sh 'cd server && cd kafka-zookeeper-node && ls && terraform init && terraform apply -var-file=toolbox1.tfvars --auto-approve'
            }
        }
        stage('Create Tool-server-1') {
            steps {
                sh 'cd server && cd Tool-server-1 && ls && terraform init && terraform apply -var-file=monitoring.tfvars --auto-approve'
            }
        }
        stage('Play Ansible playbook') {
            steps {
               sh 'ls inventory/hosts'
               sh 'sudo chmod 755 inventory/hosts/ec2.py'
               sh 'sudo chmod 755 inventory/hosts/ec2.ini'
               sh 'ls'
               sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/hosts/ec2.py -u AUTO_USER --private-key=/home/jenkins/.ssh/id_rsa -vvvvv'
            }
        }
    }
}


