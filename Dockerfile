FROM ruby:2.7.1

RUN apt-get update
RUN apt-get install sqlite3
RUN gem install bundler

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/

CMD ["bundle", "exec", "hanami", "server", "--host=0.0.0.0"]
