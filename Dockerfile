FROM ruby:2.5

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

CMD ruby game_runner.rb
