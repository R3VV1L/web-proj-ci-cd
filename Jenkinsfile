pipeline {
    agent {
        docker {
            image 'node:14-alpine'
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
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
                sh 'docker build -t my-react-app .'
                sh 'docker run -p 5172:5172 -v /var/run/docker.sock:/var/run/docker.sock my-react-app'
            }
        }
    }
}
