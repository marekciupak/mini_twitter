defmodule MiniTwitterWeb.PageController do
  use MiniTwitterWeb, :controller

  alias MiniTwitter.Tweets

  def index(conn, _params) do
    tweets = Tweets.list_tweets()
    render(conn, "index.html", tweets: tweets)
  end
end
