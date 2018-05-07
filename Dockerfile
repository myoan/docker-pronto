FROM ruby:2.5-alpine3.7

RUN apk --update add make g++ cmake && rm -rf /var/cache/apk/*

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs=4 --retry=3 --path vendor/bundle
