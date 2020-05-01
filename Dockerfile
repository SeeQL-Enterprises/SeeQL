FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential

# PostgreSQL
RUN apt-get install -y postgresql-client
RUN apt-get install -y libpq-dev

# Nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

RUN mkdir /seeql
WORKDIR /seeql

COPY Gemfile /seeql/Gemfile
COPY Gemfile.lock /seeql/Gemfile.lock

RUN bundle install

COPY . /seeql

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
