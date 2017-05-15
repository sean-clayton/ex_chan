use Mix.Config

config :ex_chan, ExChan.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("POSTGRES_DB")       || "ex_chan_test",
  username: System.get_env("POSTGRES_USER")     || "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  hostname: System.get_env("DB_HOST")           || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
