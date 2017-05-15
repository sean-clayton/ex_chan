defmodule ExChan.BoardSetting do
  use Ecto.Schema
  alias ExChan.{Board, Setting}

  schema "boards_settings" do
    belongs_to :board, Board
    belongs_to :setting, Setting
    field :value, :string

    timestamps()
  end
end
