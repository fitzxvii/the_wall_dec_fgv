FROM ruby:2.5.9-alpine
ENV BUNDLE_PATH /bundle
ADD . /app
WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN apk --update add --virtual build-dependencies build-base nodejs tzdata mysql-dev && \
    gem install bundler -v 2.3.26 && \
    cd /app && bundle install