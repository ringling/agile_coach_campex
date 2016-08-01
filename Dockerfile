FROM bitwalker/alpine-elixir-phoenix:6.0
MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>

EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod

# Cache npm deps
ADD package.json package.json
RUN ls -la

# Same with elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .
RUN npm install

# Run frontend build, compile, and digest assets
RUN brunch build --production && \
    mix do compile, phoenix.digest

USER default

CMD ["mix", "phoenix.server"]
