pipeline {
    agent {
        docker {
            image 'python:3.9.6-alpine'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh 'python pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Linter') {
            agent {
                docker {
                    image 'nvuillam/mega-linter:v4'
                    args "-e VALIDATE_ALL_CODEBASE=true -v ${WORKSPACE}:/tmp/lint --entrypoint=''"
                    reuseNode true
                }
            }
            steps {
                sh '/entrypoint.sh'
            }
        }
        stage('Test'){
            steps {
                echo "Testing..."
                sh "cd app_python/app"
                sh "pytest unit_tests.py"
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
            }
        }
        def app

        stage('Clone repository') {

            checkout scm
        }

        stage('Build image') {

           app = docker.build("marko453/devops")
        }

        stage('Push image') {

            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-token') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }
    }
}