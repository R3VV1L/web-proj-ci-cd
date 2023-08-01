#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'node'
            alwaysPull true
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
                sh 'npm install -g serve'
                sh 'serve -s build -l http://62.109.15.160:5172'
            }
        }
    }
}
