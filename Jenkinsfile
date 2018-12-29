pipeline {
  agent any
  stages {
    stage('run tests') {
      steps {
        sh '''[ -d jenkins ] && rm -rf jenkins
mkdir jenkins

export BROWSER_NAME=chrome
export DRIVER=SELENIUM
export RAILS_ENV=test
export SPEC_OPTS="--no-drb --format documentation --format html --out jenkins/rspec.html"

/Users/brunogarcia/.rvm/gems/ruby-2.4.3/bin/bundle exec rspec "./tests/google/search.rb"'''
      }
    }
  }
  post {
    always {
      archiveArtifacts(artifacts: 'build/libs/**/*.jar', fingerprint: true)
      junit './build/reports/rspec_results.xml'

    }

  }
}