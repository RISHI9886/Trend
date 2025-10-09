pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Jenkins credentials ID
        KUBECONFIG = '/var/lib/jenkins/.kube/config'
        IMAGE_NAME = 'rishi9886/trend-app:latest'
        GIT_REPO = 'https://github.com/RISHI9886/Trend.git'
        GIT_BRANCH = 'main'
    }

    stages {

        stage('Checkout SCM') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO}", credentialsId: 'GITHUB-CREDENTIALS'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', 
                                                 usernameVariable: 'USER', 
                                                 passwordVariable: 'PASS')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push ${IMAGE_NAME}"
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                withEnv(["KUBECONFIG=${KUBECONFIG}"]) {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
