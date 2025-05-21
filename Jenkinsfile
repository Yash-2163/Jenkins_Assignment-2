pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Set this in Jenkins credentials
        IMAGE_NAME = "yash-2163/jenkins-pipeline-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://your-repo-url.git' // Update with your actual repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${}").push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Image built and pushed to Docker Hub successfully!"
        }
        failure {
            echo "Something went wrong during the pipeline."
        }
    }
}
