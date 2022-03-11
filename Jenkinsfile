pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t ap3xmea/api:build-$BUILD_NUMBER .'
			}
		}
		stage('Push to Dockerhub'){
			steps{
            sh 'docker push ap3xmea/api:build-$BUILD_NUMBER'
			}
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./kubernetes/nginx.yaml
            kubectl apply -f ./kubernetes/api-deployment.yml
			'''
			}
		}
        stage('Cleanup'){
			steps{
            sh 'docker system prune'
			}
		}
    }
}
