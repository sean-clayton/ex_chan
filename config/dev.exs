use Mix.Config

config :ex_chan, ExChan.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ex_chan_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
