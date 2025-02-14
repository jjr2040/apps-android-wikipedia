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
      when {
        expression {
          params.ENABLE_E2E
        }

      }
      steps {
        warnError(message: 'Error running appium') {
          nodejs('nodejs') {
            dir(path: 'appium') {
              sh "UPDATE_SNAPSHOTS=${params.UPDATE_SNAPSHOTS} npm test"
            }

          }

        }

      }
      post {
        always {
          dir('appium') {
            archiveArtifacts artifacts: 'snapshots/__diff_snapshots__/**/*.png', fingerprint: true
            // junit 'cypress/results/**/*.xml'
          }
        }
      }
    }

    stage('Random Testing') {
      when {
        expression {
          params.ENABLE_RANDOM_TESTING
        }

      }
      steps {
        warnError(message: 'Monkeys broke something') {
          sh "bash ./scripts/tests/monkey-test.sh ${params.NUM_RANDOM_EVENTS}"
        }

      }
    }

  }
  parameters {
    string(name: 'NUM_RANDOM_EVENTS', defaultValue: '1000', description: 'Number of events for Random testing')
    booleanParam(name: 'ENABLE_E2E', defaultValue: true, description: 'Enable E2E testing')
    booleanParam(name: 'ENABLE_RANDOM_TESTING', defaultValue: true, description: 'Enable random testing testing')
    booleanParam(name: 'UPDATE_SNAPSHOTS', defaultValue: false, description: 'Should updated VRT snapshots')
  }
}