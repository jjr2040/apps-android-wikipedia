pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        catchError() {
          withGradle() {
            sh './gradlew assembleDev'
          }

        }

      }
    }

  }
}