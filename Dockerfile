FROM ruby:2.7.1
ENV BUNDLER_VERSION=2.1.4

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y \
      binutils-gold \
      curl \
      file \
      git \
      less \
      libffi-dev \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      netcat-openbsd \
      nodejs \
      openssl \
      pkg-config \
      postgresql \
      python \
      tzdata


# Fixing Yarn issues
# RUN sudo apt remove cmdtest
# RUN sudo apt remove yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update
RUN sudo apt-get install -y yarn


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

RUN yarn install

# Copy the rest of the app
COPY . /seeql

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
