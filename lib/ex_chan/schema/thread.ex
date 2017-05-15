defmodule ExChan.Thread do
  use Ecto.Schema
  alias ExChan.{Board,Post}

  schema "threads" do
    belongs_to :board, Board
    has_many :posts, Post

    timestamps()
  end
end
