defmodule ExChan.Board do
  use Ecto.Schema
  alias ExChan.{Thread}

  schema "boards" do
    field :slug, :string
    field :name, :string
    field :description, :string
    has_many :threads, Thread

    timestamps()
  end
end
