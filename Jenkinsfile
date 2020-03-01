pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        catchError() {
          withGradle() {
            sh './gradlew assembleDev'
          }

          nodejs('nodejs') {
            dir(path: 'appium') {
              sh 'npm install'
            }

          }

        }

      }
    }

    stage('E2E Tests') {
      parallel {
        stage('E2E Tests') {
          steps {
            warnError(message: 'Error running appium') {
              nodejs('nodejs') {
                dir(path: 'appium') {
                  sh 'npm test'
                }

              }

            }

          }
        }

        stage('Random Testing') {
          steps {
            warnError(message: 'Monkeys broke something') {
              sh './scripts/monkey-test.sh'
            }

          }
        }

      }
    }

  }
}