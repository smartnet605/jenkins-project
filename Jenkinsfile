pipeline {
    agent {
        docker { image 'node:lts' } // Use Node.js Docker image as the build environment
    }

    environment {
        APP_NAME = 'nodejs-mysql-app' // Name of the Docker container
        IMAGE_NAME = 'nodejs-mysql-app-image' // Name of the Docker image
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code from Git repository...'
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh """
                    docker stop $APP_NAME || true
                    docker rm $APP_NAME || true
                    docker run -d --name $APP_NAME -p 3000:3000 $IMAGE_NAME
                """
            }
        }
    }
    post {
        success {
            echo 'Application deployed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
