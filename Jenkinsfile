pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        sh '''FROM ruby:2.4.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install RMagick
# RUN apt-get install -y libmagickwand-dev imagemagick

# Install Nokogiri
# RUN apt-get install -y zlib1g-dev

RUN mkdir /myapp
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install -j 4

ADD . /myapp
WORKDIR /myapp

export BROWSER_NAME=chrome
export DRIVER=SELENIUM
bundle exec rspec "./tests/google/search.rb"'''
      }
    }
  }
}