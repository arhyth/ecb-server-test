use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ecb_server_test, EcbServerTestWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ecb_server_test, EcbServerTest.Repo,
  username: "postgres",
  password: "postgres",
  database: "ecb_server_test_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
