FROM trenpixster/elixir:latest

MAINTAINER Thomas Ringling <thomas.ringling@gmail.com>
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get update && apt-get install -qy git nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN echo %sudo    ALL=NOPASSWD: ALL>>/etc/ssudoers
RUN npm install -g brunch
RUN useradd -m -G sudo app

ENTRYPOINT /bin/bash
root@app03:~/builds# cat build.sh
cd /root/agile_coach_campex
git reset --hard origin/master
git pull
cp ../prod.secret.exs config/
npm install
brunch build --production
yes | mix deps.get
MIX_ENV=prod mix phoenix.digest
MIX_ENV=prod mix release 
cd ..
cp agile_coach_campex/rel/agile_coach_campex/*.tar.gz .