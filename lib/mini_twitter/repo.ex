defmodule MiniTwitter.Repo do
  use Ecto.Repo,
    otp_app: :mini_twitter,
    adapter: Ecto.Adapters.Postgres
end
