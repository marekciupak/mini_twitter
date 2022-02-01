defmodule MiniTwitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :author, :string
      add :message, :string

      timestamps()
    end
  end
end
