pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rajeevmagar/kali-todo:v1.0.1'
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
                    // Define the credentials ID for Docker Hub
                    def dockerHubCreds = '10462078-a2fa-4a40-a943-e45eff360061'

                    // Push the Docker image to Docker Hub
                    withCredentials([usernamePassword(credentialsId: dockerHubCreds, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('', '10462078-a2fa-4a40-a943-e45eff360061') {
                            sh "docker login -u \$DOCKER_USERNAME -p \$DOCKER_PASSWORD"
                            sh "docker push $DOCKER_IMAGE"
                        }
                    }
                }
            }
        }
    }
}


// pipeline {

//     agent any

//     environment {
//         IMAGE_NAME = "rajeevmagar/kali-todo"
//         IMAGE_TAG = "v1.0.${BUILD_NUMBER}"
//         DOCKERFILE_PATH = "Dockerfile"
//         DOCKERHUB_CREDENTIALS = "10462078-a2fa-4a40-a943-e45eff360061"
//         DOCKER_REGISTRY = "https://registry.hub.docker.com/"
//     }   

//     stages {
//         /* Stage build */ 
//         stage('Build') {
//             steps {
//                 script {
//                     customImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}", "--file ${DOCKERFILE_PATH} .")
//                 }
//             }
//         }
//         /* Stage push the customImage to dockerhub */
//         stage('Push') {
//             steps {
//                 script {
//                     withDockerRegistry([credentialsId: "${DOCKERHUB_CREDENTIALS}", url: DOCKER_REGISTRY]) {
//                         dockerImage.push()
//                     }
//                     //  withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
//                     //     sh "echo \${DOCKER_PASSWORD} | docker login -u \${DOCKER_USERNAME} --password-stdin \${DOCKER_REGISTRY}"
//                     //     // docker.withRegistry('', "${DOCKERHUB_CREDENTIALS}") {
//                     //         customImage.push()
//                     //     // }
//                     // }
//                 }
//             }
//         } 
//     }
// }
