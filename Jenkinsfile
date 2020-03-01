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

    stage('E2E Tests') {
      steps {
        warnError(message: 'Error running appium') {
          sh '''cd appium
npm test'''
        }

      }
    }

  }
}