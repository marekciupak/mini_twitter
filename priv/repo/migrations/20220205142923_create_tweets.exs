defmodule MiniTwitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :author_name, :string
      add :author_email, :string
      add :message, :string

      timestamps()
    end
  end
end
