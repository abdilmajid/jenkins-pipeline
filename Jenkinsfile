pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    triggers {
        githubPush() 
    }
    stages {
        stage('Build') {
            steps {
                echo "Building Stage..."
                sh '''
                cd app
                pip3 install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing Stage..."
                sh '''
                cd app
                which python3
                python3 hello.py
                python3 hello.py --name=Abdil
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver Stage...'
                sh '''
                echo "doing delivery stuff again.."
                '''
            }
        }
    }
}
