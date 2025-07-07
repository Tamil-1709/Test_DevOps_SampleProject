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
                bat 'pip install --upgrade sqlfluff'
            }
        }

        stage('Lint SQL Files') {
            steps {
                // Run sqlfluff and save result to file, but prevent pipeline failure
                bat 'sqlfluff lint .\\SQL > sqlfluff_report.txt || exit 0'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'sqlfluff_report.txt', allowEmptyArchive: true
            echo 'Pipeline completed.'
        }
    }
}
