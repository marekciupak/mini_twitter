defmodule MiniTwitter.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tweets" do
    field :author_email, :string
    field :author_name, :string
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:author_name, :author_email, :message])
    |> validate_required([:author_name, :author_email, :message])
    |> validate_format(:author_email, ~r/@/)
    |> validate_length(:author_name, min: 3)
    |> validate_length(:author_name, max: 24)
    |> validate_length(:message, min: 2)
    |> validate_length(:message, max: 124)
  end
end
