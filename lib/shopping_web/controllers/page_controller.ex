defmodule ShoppingWeb.PageController do
  use ShoppingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
