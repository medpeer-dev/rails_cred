FROM ruby:3.1.6-alpine

WORKDIR /app

ENV RAILS_VERSION=7.0.8.3
ENV EDITOR=vim

RUN apk update && apk add --update \
     build-base \
     vim \
     && rm -rf /var/cache/apk/*

RUN gem i rails --no-document --version $RAILS_VERSION
RUN rails new \
      --skip-git \
      --skip-keeps \
      --skip-action-mailer \
      --skip-action-mailbox \
      --skip-action-text \
      --skip-active-record \
      --skip-active-storage \
      --skip-action-cable \
      --skip-asset-pipeline \
      --skip-javascript \
      --skip-hotwire \
      --skip-jbuilder \
      --skip-test \
      --skip-system-test \
      --skip-bootsnap \
      .

RUN rm Gemfile Gemfile.lock \
      && bundle init \
      && echo "gem 'rails', '$RAILS_VERSION'" >> Gemfile \
      && bundle install

ENTRYPOINT ["bin/rails", "credentials:edit"]
