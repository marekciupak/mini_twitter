defmodule MiniTwitterWeb.PageController do
  use MiniTwitterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
