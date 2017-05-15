defmodule ExChan.Board do
  use Ecto.Schema
  alias ExChan.{Board, Thread, Repo}
  import Ecto.Changeset

  schema "boards" do
    field :slug, :string
    field :name, :string
    field :description, :string
    has_many :threads, Thread

    timestamps()
  end

  @required_fields ~w(slug name)a
  @optional_fields ~w(description)a

  def changeset(board, params \\ %{}) do
    board
    |> cast(params, @required_fields ++ @optional_fields)
    |> update_change(:slug, &String.downcase/1)
    |> update_change(:name, &String.downcase/1)
    |> unique_constraint(:slug)
    |> validate_required([:slug, :name])
    |> validate_format(:slug, ~r/[a-zA-Z0-9]+/u)
  end
end
