defmodule MiniTwitter.TweetsTest do
  use MiniTwitter.DataCase

  alias MiniTwitter.Tweets

  describe "tweets" do
    alias MiniTwitter.Tweets.Tweet

    import MiniTwitter.TweetsFixtures

    @invalid_attrs %{author_email: nil, author_name: nil, message: nil}

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Tweets.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Tweets.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      valid_attrs = %{author_email: "some@author_email", author_name: "some author_name", message: "some message"}

      assert {:ok, %Tweet{} = tweet} = Tweets.create_tweet(valid_attrs)
      assert tweet.author_email == "some@author_email"
      assert tweet.author_name == "some author_name"
      assert tweet.message == "some message"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tweets.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      update_attrs = %{author_email: "some@updated author_email", author_name: "some updated author_name", message: "some updated message"}

      assert {:ok, %Tweet{} = tweet} = Tweets.update_tweet(tweet, update_attrs)
      assert tweet.author_email == "some@updated author_email"
      assert tweet.author_name == "some updated author_name"
      assert tweet.message == "some updated message"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tweets.update_tweet(tweet, @invalid_attrs)
      assert tweet == Tweets.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Tweets.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Tweets.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Tweets.change_tweet(tweet)
    end
  end
end
