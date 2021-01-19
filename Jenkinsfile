pipeline {
    agent { label 'jenkinslocal' }
    stages {
        stage('Docker Build') {
            steps {
                sh 'sudo docker build -t my-php-app .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'sudo docker tag my-php-app gcr.io/gcp-training-281204/my-php-app'
                sh 'sudo docker push gcr.io/gcp-training-281204/my-php-app'
            }
        }
        stage('Helm deploy') {
            steps {
                sh 'pwd'
                sh 'ls -lrt'
                sh 'sudo /usr/local/bin/helm install my-php-app helm/my-php-app -n demoapp'
            }
        }
    }
}
