pipeline {

    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {

        stage('Terraform Version') {
            steps {
                bat 'terraform version'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-terraform']
                ]) {
                    bat 'terraform plan -input=false -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to apply Terraform changes?', ok: 'Apply'

                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-terraform']
                ]) {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment completed successfully.'
        }

        failure {
            echo 'Terraform deployment failed.'
        }
    }
}