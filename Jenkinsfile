#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'//добавить второй образ
            args '-u root'
        }
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
            agent {
                docker {
                    image 'docker'
                    args '-u root'
                }
            }
            steps {
                echo 'Deploying ....'
                sh 'docker build -t web-proj-ci-cd:latest .'
                sh 'docker run -d --name web-proj-ci-cd-container web-proj-ci-cd:latest'
            }
        }
    }
}
