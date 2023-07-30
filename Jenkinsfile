#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
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
            steps {
                echo 'Deploying ....'
                sh ' curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
                    && tar xzvf docker-17.04.0-ce.tgz \
                    && mv docker/docker /usr/local/bin \
                    && rm -r docker docker-17.04.0-ce.tgz'
                sh 'docker build -t web-proj-ci-cd:latest .'
                sh 'docker run -d --name web-proj-ci-cd-container web-proj-ci-cd:latest'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publishing on Docker Hub ....'
                sh 'docker push docker.io/r3vv1l/web-proj-ci-cd:latest'
            }
        }
    }
}
