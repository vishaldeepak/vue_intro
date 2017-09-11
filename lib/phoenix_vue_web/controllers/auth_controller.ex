defmodule PhoenixVue.LoginController do
  use PhoenixVue.Web, :controller
  alias PhoenixVue.User

  def register(conn, params) do 
    %User{} 
    |> User.registration_changeset(params)
  end
end
