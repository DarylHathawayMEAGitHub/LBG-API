pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t gcr.io/lbg-210222/api-daryl:latest -t gcr.io/lbg-210222/api-daryl:build-$BUILD_NUMBER .'
			}
		}
		stage('Push to GCR.IO'){
			steps{
                        sh 'docker push gcr.io/lbg-210222/api-daryl:build-$BUILD_NUMBER'
                        sh 'docker push gcr.io/lbg-210222/api-daryl:latest'
			}
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./kubernetes/nginx.yaml
                        kubectl apply -f ./kubernetes/api-deployment.yml
                        kubectl rollout restart deployment/api
			'''
			}
		}
                stage('Cleanup'){
			steps{
                        sh 'docker rmi gcr.io/lbg-210222/api-daryl:build-$BUILD_NUMBER'
                        sh 'docker rmi gcr.io/lbg-210222/api-daryl:latest'
			}
		}
    }
}
