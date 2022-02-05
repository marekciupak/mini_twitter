defmodule MiniTwitterWeb.TweetController do
  use MiniTwitterWeb, :controller

  alias MiniTwitter.Tweets
  alias MiniTwitter.Tweets.Tweet

  action_fallback MiniTwitterWeb.FallbackController

  def index(conn, _params) do
    tweets = Tweets.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  def create(
    conn,
    %{"tweet" => %{"author" => %{"name" => author_name, "email" => author_email}, "message" => message}}
  ) do
    tweet_params = %{"author_name" => author_name, "author_email" => author_email, "message" => message}

    with {:ok, %Tweet{} = tweet} <- Tweets.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Tweets.get_tweet!(id)
    render(conn, "show.json", tweet: tweet)
  end

  def update(
    conn,
    %{"id" => id, "tweet" => %{"author" => %{"name" => author_name, "email" => author_email}, "message" => message}}
  ) do
    tweet_params = %{"author_name" => author_name, "author_email" => author_email, "message" => message}

    tweet = Tweets.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Tweets.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Tweets.get_tweet!(id)

    with {:ok, %Tweet{}} <- Tweets.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
end
