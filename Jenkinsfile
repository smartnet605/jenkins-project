pipeline {
    agent any

    environment {
        // Set variables for repository, Docker image, etc.
        GITHUB_REPO = 'https://github.com/smartnet605/jenkins-project.git' // Replace with your actual GitHub repository
        IMAGE_NAME = 'your-app-image'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone GitHub Repository') {
            steps {
                // Pull the latest code from GitHub repository
                git url: "${GITHUB_REPO}", branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile in the repository
                    docker.build("${IMAGE_NAME}:${DOCKER_TAG}")
                }
            }
        }

        stage('Deploy Website in Docker') {
            steps {
                script {
                    // Stop any running container with the same name
                    sh 'docker ps -q --filter "name=your-app-container" | xargs --no-run-if-empty docker stop'

                    // Remove the old container if exists
                    sh 'docker rm -f your-app-container'

                    // Run the new Docker container from the built image
                    sh 'docker run -d --name your-app-container -p 8080:80 ${IMAGE_NAME}:${DOCKER_TAG}'
                }
            }
        }
    }
}
