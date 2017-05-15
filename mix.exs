defmodule ExChan.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_chan,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [
        tool: ExCoveralls,
      ],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
      ]
    ]
  end

  def application do
    [extra_applications: [:logger],
     mod: {ExChan.Application, []}]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate --quiet", "run priv/repo/seeds.exs --quiet"],
      "test": ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate", "test"],
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.13"},
      {:comeonin, "~> 3.0"},
      {:faker, "~> 0.8"},
      {:excoveralls, "~> 0.6", only: :test},
    ]
  end
end
