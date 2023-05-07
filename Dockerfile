FROM ruby:2.7

# hadolint ignore=DL3008,DL3009,DL3015,DL4006
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y nodejs yarn

WORKDIR /app
COPY ./src/Gemfile /app/Gemfile
RUN bundle config --local set path 'vendor/bundle' && \
    bundle install