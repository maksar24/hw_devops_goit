pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  serviceAccountName: jenkins-sa
  containers:
    - name: kaniko
      image: gcr.io/kaniko-project/executor:latest
      args: ["--dockerfile=/workspace/Dockerfile", "--context=/workspace", "--destination=${ECR_REPO_URL}:${GIT_COMMIT}", "--insecure"]
      volumeMounts:
        - name: workspace
          mountPath: /workspace
  volumes:
    - name: workspace
      emptyDir: {}
"""
        }
    }

    environment {
        ECR_REPO_URL = '685873929524.dkr.ecr.eu-west-2.amazonaws.com/lesson-7-ecr'
        AWS_DEFAULT_REGION = 'eu-west-2'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/maksar24/hw_devops_goit.git'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                container('kaniko') {
                    sh '/kaniko/executor --dockerfile=/workspace/Dockerfile --context=/workspace --destination=$ECR_REPO_URL:$GIT_COMMIT'
                }
            }
        }

        stage('Update Helm Chart') {
            steps {
                sh '''
                cd path/to/helm/chart
                yq e ".image.tag = \\"$GIT_COMMIT\\"" -i values.yaml
                git config user.name "jenkins"
                git config user.email "jenkins@example.com"
                git add values.yaml
                git commit -m "Update image tag to $GIT_COMMIT"
                git push origin main
                '''
            }
        }
    }
}
