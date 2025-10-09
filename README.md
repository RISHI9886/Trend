<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/4a9847c2-469b-45c6-8e85-960a86f1b129" />



<img width="2560" height="1436" alt="image" src="https://github.com/user-attachments/assets/e7a975cd-cd30-4853-a2b6-86b258acd113" />


Trend React App Deployment Project


One-Line Summary

Deploy a React application on AWS using Docker, Terraform, Jenkins CI/CD, Kubernetes (EKS), and DockerHub, with automated build, deployment, and monitoring.

Project Overview

This project demonstrates how to deploy a production-ready React application on AWS using modern DevOps practices:

Version Control with Git/GitHub

Containerization using Docker

Infrastructure as Code using Terraform

CI/CD Automation with Jenkins

Orchestration with Kubernetes on AWS EKS

Monitoring using Prometheus & Grafana

The workflow automates the full lifecycle: development → containerization → infrastructure provisioning → CI/CD → Kubernetes deployment → monitoring.

Tools & Services

| Category               | Tools/Services      | Purpose                                       |
| ---------------------- | ------------------- | --------------------------------------------- |
| Version Control        | Git, GitHub         | Store and manage code; trigger CI/CD pipeline |
| Containerization       | Docker, DockerHub   | Build container images and deploy             |
| Infrastructure as Code | Terraform           | Provision AWS infrastructure automatically    |
| CI/CD                  | Jenkins             | Automate build, push, and deployment          |
| Orchestration          | Kubernetes, AWS EKS | Deploy and manage app containers              |
| Monitoring             | Prometheus, Grafana | Track app and cluster health                  |
| Cloud Provider         | AWS                 | Host infrastructure (EC2, EKS, VPC, IAM)      |


Step-by-Step Instructions
1. Version Control

Clone the repository:

git clone https://github.com/Vennilavan12/Trend.git

cd Trend


Add .gitignore for unnecessary files (node_modules, build folders) and .dockerignore to optimize Docker build.

Commit and push:

git add .

git commit -m "Initial commit with Docker & Kubernetes setup"

git push origin main

2. Dockerization

Objective: Containerize React app using Nginx.

Create Dockerfile 

Build & Run Locally:

docker build -t trend-app:latest .
docker run -p 3000:80 trend-app:latest


Push to DockerHub:

docker login
docker tag trend-app:latest <dockerhub-username>/trend-app:latest
docker push <dockerhub-username>/trend-app:latest

3. Infrastructure with Terraform

Objective: Provision AWS resources.

Terraform Workflow:

terraform init      # Initialize Terraform
terraform plan      # Preview planned infrastructure
terraform apply     # Provision AWS resources

Provisioned Resources Include:

VPC, Subnets, Security Groups

EC2 instance for Jenkins

IAM Roles for EKS

AWS EKS cluster with worker nodes

4. Jenkins CI/CD Pipeline

Objective: Automate build, Docker push, and Kubernetes deployment.

Install Jenkins on EC2 instance.

Install plugins: Docker, Git, Kubernetes, Pipeline.

Configure GitHub webhook → triggers Jenkins pipeline on every push.

Declarative Pipeline (Jenkinsfile)

5. Kubernetes Deployment

Objective: Deploy app on EKS with LoadBalancer.

Deployment YAML (k8s/deployment.yaml)
Service YAML (k8s/service.yaml)

Commands:

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get svc

6. Monitoring

Objective: Track app and cluster health.

Setup Prometheus & Grafana:

Deploy via Kubernetes manifests.

Access Grafana dashboard:

kubectl port-forward svc/grafana 3000:3000


Monitor metrics: CPU, memory, pod status.

Configure alerts for failures.

7. Best Practices

Use .gitignore and .dockerignore to keep repository and images clean.

Commit meaningful changes to trigger CI/CD reliably.

Use credentials securely (Jenkins Credentials Manager, not plain text).

Test locally before deploying to production.

8. End-to-End Flow

Developer pushes code → GitHub webhook triggers Jenkins.

Jenkins builds Docker image → pushes to DockerHub.

Jenkins deploys container to EKS.

LoadBalancer exposes the app → accessible via browser.

Prometheus & Grafana monitor app health.

9. Screenshots & Results

(Add screenshots of your app running on browser, Jenkins pipeline build, Kubernetes pods, LoadBalancer URL, and monitoring dashboards.)

10. Additional Notes

App port: 3000

DockerHub repository: rishi9886/trend-app

LoadBalancer URL: http://a3aedef3cec0a438186c3009b4811804-228352730.us-east-2.elb.amazonaws.com

CI/CD ensures fully automated deployment.

Jenkins pipeline

<img width="2560" height="1432" alt="42" src="https://github.com/user-attachments/assets/c13fc0ab-3518-4d78-b935-b3efa12a7c7b" />


GRAFANA DASHBOARD

<img width="2560" height="1444" alt="43" src="https://github.com/user-attachments/assets/b944ee8c-d549-45bb-b5b8-8fcbfd92b18b" />

