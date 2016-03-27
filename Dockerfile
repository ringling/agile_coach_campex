FROM ringling/elixir:latest
MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>
RUN su root
RUN apt-get update
RUN apt-get -qy install apt-utils curl git sudo nodejs npm
RUN yes | apt-get install -qy postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN echo %sudo ALL=NOPASSWD: ALL>>/etc/ssudoers
RUN npm install -g brunch
#RUN useradd -m -G app

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
RUN yes | mix deps.compile

EXPOSE 8080

ENTRYPOINT /phoenixapp/scripts/start-server.sh
