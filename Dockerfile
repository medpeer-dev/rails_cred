FROM ruby:2.7.1-alpine

WORKDIR /app

ENV RAILS_VERSION=6.0.6.1
ENV EDITOR=vim

RUN apk update && apk add --update \
     build-base \
     vim \
     && rm -rf /var/cache/apk/*

RUN gem i rails --no-document --version $RAILS_VERSION
RUN rails new \
      --skip-gemfile \
      --skip-git \
      --skip-keeps \
      --skip-action-mailer \
      --skip-action-mailbox \
      --skip-action-text \
      --skip-active-record \
      --skip-active-storage \
      --skip-puma \
      --skip-action-cable \
      --skip-sprockets \
      --skip-spring \
      --skip-listen \
      --skip-javascript \
      --skip-turbolinks \
      --skip-test \
      --skip-system-test \
      --skip-bootsnap \
      --skip-webpack-install \
      .
RUN bundle init \
      && echo "gem 'rails', '$RAILS_VERSION'" >> Gemfile \
      && bundle install

ENTRYPOINT ["bin/rails", "credentials:edit"]
