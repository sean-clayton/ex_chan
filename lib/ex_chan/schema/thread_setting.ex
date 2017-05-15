defmodule ExChan.ThreadSetting do
  use Ecto.Schema
  alias ExChan.{Thread, Setting}

  schema "threads_settings" do
    belongs_to :thread, Thread
    belongs_to :setting, Setting
    field :value, :string

    timestamps()
  end
end
