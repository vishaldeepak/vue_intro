defmodule PhoenixVue.LoginController do
  use PhoenixVue.Web, :controller
  alias PhoenixVue.User
  
  action_fallback PhoenixVue.FallbackController   

  def register(conn, params) do 
    %User{} 
    |> User.registration_changeset(params)
  end
end
