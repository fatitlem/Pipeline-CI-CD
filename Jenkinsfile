pipeline {
    agent any

    environment {
        DOCKER_IMAGE_BACKEND = 'fatimazahraerhmaritlemcani132/pfa-ci-cd-backend:v1.0'
        DOCKER_IMAGE_FRONTEND = 'fatimazahraerhmaritlemcani132/pfa-ci-cd-frontend:v1.0'
        DOCKER_IMAGE_DB = 'fatimazahraerhmaritlemcani132/mysql:v1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch from GitHub
                git branch: 'main',
                    url: 'https://github.com/fatitlem/Pipeline-CI-CD.git',
                    credentialsId: '' // Ajoute ton credentialsId ici si nécessaire
            }
        }

        stage('Pull Database Image') {
            steps {
                script {
                    sh "docker pull ${env.DOCKER_IMAGE_DB}"
                }
            }
        }

        stage('Pull Backend Image') {
            steps {
                script {
                    sh "docker pull ${env.DOCKER_IMAGE_BACKEND}"
                }
            }
        }

        stage('Build Frontend') {
            steps {
                script {
                    // Assurer le bon contexte pour le build frontend
                    // Si tu construis l'image frontend à partir du code source, utilise un Dockerfile approprié
                    sh "docker build -t ${env.DOCKER_IMAGE_FRONTEND} ./frontend-directory"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker-compose up -d --build"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
