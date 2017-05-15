use Mix.Config

config :ex_chan, ecto_repos: [ExChan.Repo]

import_config "#{Mix.env}.exs"
