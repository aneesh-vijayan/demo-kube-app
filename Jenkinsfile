pipeline {
    agent { label 'jenkinslocal' }
    stages {
        stage('Example Build') {
            steps {
                sh 'docker build -t my-php-app .'
            }
        }
    }
}
