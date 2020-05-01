FROM ruby:2.7
ENV BUNDLER_VERSION=2.1.4

RUN apt-get update -qq && apt-get install -y build-essential

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn


# PostgreSQL
RUN apt-get install -y postgresql-client
RUN apt-get install -y libpq-dev

# Nokogiri
RUN apt-get install -y libxslt1-dev

# --------------- Ruby Gems Setup ---------------

# Bundler
RUN gem install bundler -v 2.1.4

RUN mkdir /seeql
WORKDIR /seeql

COPY Gemfile /seeql/Gemfile
COPY Gemfile.lock /seeql/Gemfile.lock

# Config for Nokogiri
RUN bundle config build.nokogiri --use-system-libraries

# Check whether the gems are already installed before installing
RUN bundle check || bundle install

# --------------- JS Packages Setup ---------------

COPY package.json yarn.lock ./

RUN yarn install --check-files

# Copy the rest of the app
COPY . /seeql

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
