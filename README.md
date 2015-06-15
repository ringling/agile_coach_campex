# AgileCoachCampex

# Setup

## Config variables

Remember to set these config variables in your prod.secret.exs

```
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

http://www.phoenixframework.org/v0.13.1/docs/overview

```bash
# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

# Then install nodejs with:
sudo apt-get install -y nodejs

#Install brunch
npm install -g brunch

# Install inotify-tools
sudo apt-get install inotify-tools
```

## Setup Docker PostgreSQL

```
docker run --name postgresql -p 5432:5432 -d -v /<LOCALPATH>/postgres/data:/var/lib/postgresql sameersbn/postgresql:9.4
docker exec -it postgresql sudo -u postgres createuser -P -d -r -s elixir
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_test
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_dev
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_prod
```

## Deploy

```
cd acc_deploy/agile_coach_campex/
git pull
docker build -t ringling/agile_coach_campex .
docker stop app
docker rm app
docker run -p 80:8080 -i --link postgresql:elixir --name app -d ringling/agile_coach_campex
```

## DB backup
```
docker exec -it postgresql sudo -u postgres pg_dump agile_coach_campex_prod > agile_coach_campex_prod_db.bak
``
