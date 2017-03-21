# Agile Coach Camp

Phoenix app, containing web site

[![Build Status](https://semaphoreci.com/api/v1/projects/e0151ad7-cd12-4675-9aea-1de3433b0a63/461750/badge.svg)](https://semaphoreci.com/ringling/agile_coach_campex)

# Setup

## Config variables

Remember to set these config variables in your prod.secret.exs

```elixir

# Configure your database
config :agile_coach_campex, AgileCoachCampex.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "elixir",
  username: "elixir",
  password: "...",
  database: "agile_coach_campex_prod",
  size: 20 # The amount of database connections in the pool

config :agile_coach_campex, :mail,
  smtp_relay: "...",
  smtp_port: 587,
  mailchimp_password: "...",
  mailchimp_username: "...",
  from: "..."

config :agile_coach_campex, :admin,
  password: "..."
```

# Installation

## Setup Docker PostgreSQL

```sh
docker run --name postgresql -p 5432:5432 -d -v $PWD/postgres/data:/var/lib/postgresql sameersbn/postgresql:9.4
docker exec -it postgresql sudo -u postgres createuser -P -d -r -s elixir
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_prod
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_test
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_dev
```

In development mode you don't need `-v $PWD/postgres/data:/var/lib/postgresql`, unless you want to keep data between runs

### DB backup
```sh
docker exec -it postgresql sudo -u postgres pg_dump agile_coach_campex_prod > agile_coach_campex_prod_db.bak
```

## Build App image

```sh
cd acc_deploy/agile_coach_campex/
git pull
rm -rf node_modules/
mix deps.clean --all
docker build -t ringling/agile_coach_campex .
```

## Start App Image

Before starting the _app_ image, the _postgresql_ image has to be running

```sh
docker stop app && docker rm app
docker run -p 80:5000 -i  --link postgresql:elixir --name app -d ringling/agile_coach_campex
```



# Setup Semaphore deployment

We are not using Semaphore deployment yet !!!

### Production secret config

Add prod.secret.exs in __Custom configuration files__

/home/runner/agile_coach_campex/config/prod.secret.exs


### Generate SSH keys

To give Semaphore access to app server we do the following

On app server

_Key pairs and add to authorized keys_

```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"
```


### Private SSH key

`cat ~/.ssh/id_rsa`

Copy private key and paste as described here https://semaphoreci.com/docs/generic-deployment.html under SSH key


### Deploy commands

```
sudo curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -qy git nodejs
sudo npm install -g brunch
yes | mix deps.get
npm install
brunch build --production
yes | mix local.hex --force
MIX_ENV=prod mix phoenix.digest
MIX_ENV=prod mix release
scp -o StrictHostKeyChecking=no rel/agile_coach_campex/*.tar.gz root@app01.ringling.info:/root/deploys
echo "Upgrade via ssh command"
```

## Build

_build script_

```sh
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs
npm install -g brunch

git clone https://github.com/ringling/agile_coach_campex.git
cd agile_coach_campex
npm install
brunch build --production
mix deps.get
MIX_ENV=prod mix phoenix.digest
MIX_ENV=prod mix release
PORT=8080 rel/agile_coach_campex/bin/agile_coach_campex console
PORT=8080 rel/agile_coach_campex/bin/agile_coach_campex foreground
```

# Update DO VPS

Update dist and restart
```bash
$ sudo apt-get update
$ sudo apt-get dist-upgrade
$ sudo shutdown -r now
```
Start postgres and elixir

```bash
docker start postgresql
docker start app
```
