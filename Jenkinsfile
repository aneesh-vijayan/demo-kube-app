pipeline {
    agent { label 'jenkinslocal' }
    stages {
        stage('Example Build') {
            steps {
                sh 'sudo docker build -t my-php-app .'
            }
        }
    }
}
