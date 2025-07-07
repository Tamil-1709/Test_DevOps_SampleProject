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
                bat 'pip install sqlfluff'
            }
        }

        stage('Lint SQL Files') {
            steps {
                // Lint files, output HTML report
                bat 'sqlfluff lint .\\SQL --format html --output-file sqlfluff_report.html'
            }
        }

        stage('Archive Report') {
            steps {
                // Save the report in Jenkins UI
                archiveArtifacts artifacts: 'sqlfluff_report.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
