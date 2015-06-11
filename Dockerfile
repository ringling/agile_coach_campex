FROM trenpixster/elixir:latest                                                                                                                                                                                                                                                
MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN echo %sudo    ALL=NOPASSWD: ALL>>/etc/ssudoers
RUN npm install -g brunch
RUN useradd -m -G sudo app

RUN mkdir /phoenixapp
WORKDIR /phoenixapp

COPY ./mix.exs /phoenixapp/mix.exs
COPY ./mix.lock /phoenixapp/mix.lock

RUN yes | mix local.hex
RUN yes | mix deps.get

COPY ./ /phoenixapp

ENV PORT 8080
ENV MIX_ENV prod

RUN npm install
RUN mix deps.compile

EXPOSE 8080

ENTRYPOINT /phoenixapp/scripts/start-server.sh