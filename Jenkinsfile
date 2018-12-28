pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        sh '''export BROWSER_NAME=chrome
export DRIVER=SELENIUM
bundle exec rspec "./tests/google/search.rb"'''
      }
    }
  }
}