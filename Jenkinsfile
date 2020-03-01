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
  environment {
    ANDROID_SDK_ROOT = '$HOME/Library/Android/sdk'
  }
}