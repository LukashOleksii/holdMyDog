FROM ruby:3.0.2


ENV GEM_HOME=/bundle
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH
ENV NODE_MAJOR=14


RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential curl git libpq-dev \
  && curl -sSL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash - \
  && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y --no-install-recommends nodejs yarn


RUN     mkdir -p /app
WORKDIR /app
COPY . ./


RUN gem update --system && gem install bundler:2.2.25
RUN bundle check || bundle install
RUN yarn install --check-files
