pipeline {
    agent any

    tools {
        python 'Python3'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Tamil-1709/Test_DevOps_SampleProject.git'
            }
        }

        stage('Install SQLFluff') {
            steps {
                sh 'pip install sqlfluff'
            }
        }

        stage('Lint SQL Files') {
            steps {
                sh 'sqlfluff lint ./SQL'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
