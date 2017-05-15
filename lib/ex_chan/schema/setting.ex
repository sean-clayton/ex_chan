defmodule ExChan.Setting do
  use Ecto.Schema

  schema "settings" do
    field :key, :string
    field :type, :string
    field :default_value, :string
    field :description, :string

    timestamps()
  end
end
