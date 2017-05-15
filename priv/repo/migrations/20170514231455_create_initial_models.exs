defmodule ExChan.Repo.Migrations.CreateInitialModels do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :key, :string
      add :type, :string
      add :default_value, :string, null: true
      add :description, :text

      timestamps()
    end
    create unique_index(:settings, [:key])

    create table(:boards) do
      add :slug, :string
      add :name, :string
      add :description, :text

      timestamps()
    end
    create unique_index(:boards, [:slug, :name])

    create table(:boards_settings) do
      add :board_id, references(:boards)
      add :setting_id, references(:settings)
      add :value, :string

      timestamps()
    end
    create index(:boards_settings, [:board_id, :setting_id])

    create table(:threads) do
      add :board_id, references(:boards)

      timestamps()
    end
    create index(:threads, [:board_id])

    create table(:threads_settings) do
      add :thread_id, references(:threads)
      add :setting_id, references(:settings)
      add :value, :string

      timestamps()
    end
    create index(:threads_settings, [:thread_id, :setting_id])

    create table(:posts) do
      add :thread_id, references(:threads)
      add :name, :string, null: true
      add :body, :text
      add :options, :string, null: true
      add :ip_address, :string
      add :attachment, :string, null: true

      timestamps()
    end
    create index(:posts, [:thread_id])
  end
end
