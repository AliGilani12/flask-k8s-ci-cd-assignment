pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-k8s-ci-cd-assignment"
        IMAGE_TAG = "latest"
        KUBE_MANIFEST_DIR = "kubernetes"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f ${KUBE_MANIFEST_DIR}"
            }
        }

        stage('Verify Deployment') {
            steps {
                sh "kubectl rollout status deployment/flask-k8s-app"
                sh "kubectl get pods,services"
            }
        }
    }
}
