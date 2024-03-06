pipeline {

    agent any

    environment {
        IMAGE_NAME = "rajeevmagar/kali-todo"
        IMAGE_TAG = "v1.0.${BUILD_NUMBER}"
        DOCKERFILE_PATH = "Dockerfile"
        DOCKERHUB_CREDENTIALS = "10462078-a2fa-4a40-a943-e45eff360061"
        DOCKER_REGISTRY = ""
    }   

    stages {
        /* Stage build */ 
        stage('Build') {
            steps {
                script {
                    customImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}", "--file ${DOCKERFILE_PATH} .")
                }
            }
        }
        /* Stage push the customImage to dockerhub */
        stage('Push') {
            steps {
                script {
                    withDockerRegistry([credentialsId: '10462078-a2fa-4a40-a943-e45eff360061', url: DOCKER_REGISTRY]) {
                        dockerImage.push()
                    }
                    //  withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    //     sh "echo \${DOCKER_PASSWORD} | docker login -u \${DOCKER_USERNAME} --password-stdin \${DOCKER_REGISTRY}"
                    //     // docker.withRegistry('', "${DOCKERHUB_CREDENTIALS}") {
                    //         customImage.push()
                    //     // }
                    // }
                }
            }
        } 
    }
}