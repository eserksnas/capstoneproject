pipeline{
    agent any

    stages{

        stage('Lint Dockerfile'){
            steps{
                sh 'hadolint Dockerfile'
            }
        }

        stage('Build Container'){
            steps{
                sh 'docker build -f Dockerfile -t capstoneproject --label ericserksnascapstone .'
            }
        }

        stage('Push to ECR'){
            steps{
                    withAWS(credentials: 'AWS_Credentials', region: 'us-east-1') {
                              sh '''
                              aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 378329487297.dkr.ecr.us-east-1.amazonaws.com
                              docker tag capstoneproject:latest 378329487297.dkr.ecr.us-east-1.amazonaws.com/capstoneproject:latest
                              docker push 378329487297.dkr.ecr.us-east-1.amazonaws.com/capstoneproject:latest
                              '''
                    }
            }
        }
                stage('EKS Deployment'){
            steps{
                    withAWS(credentials: 'AWS_Credentials', region: 'us-east-1') {
                              sh '''
                                aws eks --region us-east-1 update-kubeconfig --name capstonecluster2
                                kubectl config use-context arn:aws:eks:us-east-1:378329487297:cluster/capstonecluster2
                                kubectl apply -f deploytest.yml
                              '''
                    }
            }
        }
    }
}
