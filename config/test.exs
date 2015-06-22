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
  username: System.get_env("DATABASE_POSTGRESQL_USERNAME") || "elixir",
  password: System.get_env("DATABASE_POSTGRESQL_PASSWORD") || "elixir",
  database: "agile_coach_campex_test",
  size: 1 # Use a single connection for transactional tests

config :agile_coach_campex, :mail,
  smtp_relay: "smtp.my_testserver.com",
  smtp_port: 587,
  mailchimp_password: "test_pass",
  mailchimp_username: "test_user",
  from: "no-reply@test.org"

config :agile_coach_campex, :admin,
  password: "test"

  