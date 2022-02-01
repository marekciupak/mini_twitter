defmodule MiniTwitterWeb.TweetView do
  use MiniTwitterWeb, :view
  alias MiniTwitterWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      author: tweet.author,
      message: tweet.message
    }
  end
end
