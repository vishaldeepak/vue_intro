defmodule PhoenixVueWeb.AuthView do
  use PhoenixVueWeb, :view

  def render("register.json", %{user: user}) do
    %{user: user}
  end
end
