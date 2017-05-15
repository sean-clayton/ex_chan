defmodule ExChan.Post do
  use Ecto.Schema
  alias ExChan.{Thread}

  schema "posts" do
    field :body, :string
    field :name, :string
    field :attachment, :string
    field :options, :string
    field :ip_address, :string
    field :captcha_verification, :string, virtual: true
    belongs_to :thread, Thread

    timestamps()
  end
end
