defmodule PhoenixVueWeb.PageController do
  use PhoenixVueWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
