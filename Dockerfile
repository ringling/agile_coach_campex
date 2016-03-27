FROM ringling/elixir:latest
MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>

# Install pre-reqs
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    python \
    rsync \
    sudo \
    software-properties-common \
    wget \
    postgresql-client \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - && apt-get install -y nodejs

RUN mkdir /phoenixapp
WORKDIR /phoenixapp

COPY ./ /phoenixapp

# We don't want Node issues
RUN rm -rf /phoenixapp/node_modules

RUN yes | mix local.hex && mix deps.get
RUN npm install brunch -g && npm install

ENV PORT 8080
ENV MIX_ENV prod

EXPOSE 8080

ENTRYPOINT /phoenixapp/scripts/start-server.sh
