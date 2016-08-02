FROM bitwalker/alpine-elixir-phoenix:6.0
MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>

# We need psql for ecto migrations
RUN apk-install postgresql-client

EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod

# Cache npm deps
ADD package.json package.json

# Same with elixir deps
ADD scripts/start-server.sh mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

RUN npm install

# Run frontend build, compile, and digest assets
RUN brunch build --production && \
    mix do compile, phoenix.digest

RUN chmod -R 777 /opt/app

USER default

ENTRYPOINT ./start-server.sh
