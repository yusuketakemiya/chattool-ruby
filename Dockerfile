FROM ruby:2.5.3
ENV APP /app
ENV DB /db

RUN apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
# RUN apt-get install -y nodejs sqlite3 libsqlite3-dev
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev npm
RUN npm install -g n && \
    n stable
RUN npm install -g yarn
RUN npm install webpack-dev-server -g
# RUN mkdir $APP
# RUN mkdir $DB

WORKDIR $APP
ADD Gemfile* $APP/

ENV BUNDLER_VERSION 2.0.1
# RUN gem install bundler
RUN gem install bundler && bundle install --jobs 20 --retry 5
# RUN bundle install

ADD package.json $APP
ADD yarn.lock $APP
RUN yarn install

# ADD . $APP
# ADD . $DB

# ENV RAILS_ENV production
# RUN rm /db/*.sqlite3
# RUN bundle exec rake db:drop
# RUN bundle exec rake db:create
# RUN bundle exec rake db:migrate
# RUN bundle exec rake assets:precompile

# ADD ./entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# RUN /entrypoint.sh

# RUN bash -l -c 'bundle exec rake db:create; bundle exec rake db:migrate'

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
