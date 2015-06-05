use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :agile_coach_campex, AgileCoachCampex.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :agile_coach_campex, AgileCoachCampex.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "elixir",
  password: "elixir",
  database: "agile_coach_campex_test",
  size: 1 # Use a single connection for transactional tests
