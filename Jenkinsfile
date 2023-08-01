#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
            args '-p 5172:5172'
        }
    }
    environment {
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_USERNAME = credentials('r3vv1l')
        DOCKER_PASSWORD = credentials('U=X)j!A1X-N')
        DOCKER_IMAGE_NAME = 'web-proj-ci-cd'
        DOCKER_IMAGE_TAG = 'v1'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building ....'
                sh 'npm install --legacy-peer-deps'
                sh 'npm run build'
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
                sh "docker build -t ${params.DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG} ."
                sh "docker push ${params.DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}"
                sh 'docker run -d -p 5172:5172 ${params.DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${params.DOCKER_IMAGE_TAG}'
            }
        }
    }
}
