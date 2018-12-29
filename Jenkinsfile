pipeline {
  agent any
  stages {
    stage('run tests') {
      steps {
        sh '''export BROWSER_NAME=chrome
export DRIVER=SELENIUM
/Users/brunogarcia/.rvm/gems/ruby-2.4.3/bin/bundle exec rspec --format html --out ./build/reports/rspec_results.html "./tests/google/search.rb"'''
        junit './build/reports/**/*.xml'
      }
    }
  }
}