ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION
LABEL MAINTAINER=support@driftingruby.com

ARG NODE_MAJOR
ARG BUNDLE_VERSION

RUN apt-get update
RUN apt-get install build-essential -y

RUN curl -SL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install yarn -y

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v $BUNDLE_VERSION
RUN bundle install -j $(nproc)

RUN mkdir -p /app
WORKDIR /app
