defmodule PhoenixVueWeb.AuthView do
  use PhoenixVueWeb, :view

  def render("register.json", %{user: user}) do
    %{user: user_mapper(user)}
  end

  defp user_mapper(user) do 
    %{
      username: user.username,
      created_at: user.inserted_at
    }
  end
end
