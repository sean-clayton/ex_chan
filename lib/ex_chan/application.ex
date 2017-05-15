defmodule ExChan.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(ExChan.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: ExChan.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
