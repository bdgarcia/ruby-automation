pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        sh '''export BROWSER_NAME=chrome
export DRIVER=SELENIUM
/Users/brunogarcia/.rvm/gems/ruby-2.4.3/bin/bundle exec rspec "./tests/google/search.rb"'''
      }
    }
  }
}