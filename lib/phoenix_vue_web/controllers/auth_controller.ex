defmodule PhoenixVueWeb.AuthController do
  use PhoenixVueWeb, :controller  
  alias PhoenixVue.User

  action_fallback PhoenixVueWeb.FallbackController  

  def register(conn, params) do 
    with {:ok, %User{} = user} <- User.registeration_changeset(%User{} ,params) |> Repo.insert() do 
      render(conn, "register.json", user: user)
    end
  end
end
