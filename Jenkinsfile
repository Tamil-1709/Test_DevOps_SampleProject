pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install SQLFluff') {
            steps {
                bat 'pip install --upgrade sqlfluff' // recommended
            }
        }

        stage('Lint SQL Files') {
            steps {
                // Save plain text output to a file
                bat 'sqlfluff lint .\\SQL > sqlfluff_report.txt'
            }
        }

        stage('Archive Report') {
            steps {
                archiveArtifacts artifacts: 'sqlfluff_report.txt', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
