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
          nodejs('nodejs') {
            dir(path: 'appium') {
              sh '''npm install
npm test'''
            }

          }

        }

      }
    }

  }
}