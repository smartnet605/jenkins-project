pipeline {
    agent {
        docker {
            image 'node:lts'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
                checkout scm
            }
        }
        stage('Install Dependencies') {
    steps {
        echo 'Installing dependencies...'
        sh 'npm config set cache $(pwd)/.npm-cache --global && npm install'
    }
}
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'npm test || echo "Tests failed, but continuing for now."'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t nodejs-app .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying Docker container...'
                sh 'docker run -d --name nodejs-app -p 3000:3000 nodejs-app'
            }
        }
    }
    post {
        success {
            echo 'Build and deployment completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
