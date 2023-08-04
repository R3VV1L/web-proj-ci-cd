pipeline {
    agent {
        docker {
            image 'node'
            args '-u root -p 5172:5172'
        }
    }
    environment {
        DOCKER_IMAGE_NAME = 'web-proj-ci-cd'
        DOCKER_IMAGE_TAG = 'v1'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building ....'
                sh 'npm install --legacy-peer-deps'
                sh 'npm run build'
                sh 'npm i docker'
                sh 'docker start'
                sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing ....'
                echo 'no test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying ....'
                sh "docker run -d -p 5172:5172 ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
            }
        }
    }
}
