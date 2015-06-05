# AgileCoachCampex

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.



# Installation

http://www.phoenixframework.org/v0.13.1/docs/overview

```bash
# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

# Then install nodejs with:
sudo apt-get install -y nodejs

# Install inotify-tools
sudo apt-get install inotify-tool
```

## Setup Docker PostgreSQL

```
docker run --name postgresql -p 5432:5432 -d -v /<LOCALPATH>/postgres/data:/var/lib/postgresql sameersbn/postgresql:9.4
docker exec -it postgresql sudo -u postgres createuser -P -d -r -s elixir
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_test
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_dev
docker exec -it postgresql sudo -u postgres createdb -O elixir agile_coach_campex_prod
```
