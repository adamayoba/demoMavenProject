pipeline {
    agent any
    
    tools {
        maven 'maven'
    }

    stages {
        stage('Git checkout') {
            steps {
                git credentialsId: '707d8473-0039-4bfb-82aa-ef21153696d0' ,url: 'https://github.com/adamayoba/demoMavenProject.git'
            }
        }
        
        stage('Build the application') {
            steps {
                bat 'mvn clean install'
            }
        }
        
        stage('Unit Test Execution') {
            steps {
                bat 'mvn test'
            }
        }
        
        stage('Build the docker image') {
            steps {
                bat 'docker build --tag yobamansa/devops-tp7:v1.0.0 .'
            }
        }
        
        stage('Push the docker image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpass', variable: 'dockerHubPass')]){
                    bat "docker login -u yobamansa -p $dockerHubPass"
                }
                bat1 'docker push yobamansa/devops-tp7:v1.0.0'
            }
        }
    }
}
