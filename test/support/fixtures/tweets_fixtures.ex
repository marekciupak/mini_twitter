defmodule MiniTwitter.TweetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MiniTwitter.Tweets` context.
  """

  @doc """
  Generate a tweet.
  """
  def tweet_fixture(attrs \\ %{}) do
    {:ok, tweet} =
      attrs
      |> Enum.into(%{
        author_email: "some@author_email",
        author_name: "some author_name",
        message: "some message"
      })
      |> MiniTwitter.Tweets.create_tweet()

    tweet
  end
end
