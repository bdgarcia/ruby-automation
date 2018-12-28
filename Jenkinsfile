pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('') {
      steps {
        sh 'bundle exec rspec "./tests/google/search.rb"'
      }
    }
  }
}