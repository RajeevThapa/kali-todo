pipeline {
    agent any

    environment {
        IMAGE_NAME = "rajeevmagar/kali-todo"
        IMAGE_TAG = "v1.0.${BUILD_NUMBER}"
        DOCKERFILE_PATH = "Dockerfile"
        DOCKERHUB_CREDENTIALS = "10462078-a2fa-4a40-a943-e45eff360061"
    }   

    stages {
        stage('Build') {
            steps {
                script {
                    // Build your Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', "${DOCKERHUB_CREDENTIALS}") {
                        customImage.push()
                    }
                }
            }
        }
    }
}