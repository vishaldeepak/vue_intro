defmodule PhoenixVueWeb.AuthController do
  use PhoenixVueWeb, :controller  

  alias PhoenixVue.{Guardian, User}
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  action_fallback PhoenixVueWeb.FallbackController  

  def register(conn, params) do 
    with {:ok, %User{} = user} <- User.registeration_changeset(%User{} ,params) |> Repo.insert() do 
      render(conn, "register.json", user: user)
    end
  end

  def login(conn, params = %{"username" => _, "password" => _}) do
    case login_by_username_password(params) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        conn
        |> Plug.Conn.assign(:current_user, user)
        |> put_status(:created)
        |> render("login.json", token: token, user_id: user.id)

      {:error, reason} -> handle_unauthenticated(conn, reason)
    end
  end

  def login(conn, %{"username" => ""}) do
    handle_unauthenticated(conn, "Please enter your email and password.")
  end

  def login(conn, %{"username" => _email}) do
    handle_unauthenticated(conn, "Please enter your password.")
  end  

  def resource(conn, _params) do
    text conn, "Wassup niga"
  end

  defp handle_unauthenticated(conn, reason) do
    conn
    |> put_status(:unauthorized)
    |> render("401.json", message: reason)
  end

  defp login_by_username_password(%{"username" => username, "password" => password}) do 
    user = Repo.get_by(User, username: username)
    cond do
      user && checkpw(password, user.password_hash) ->
        {:ok, user}
      user ->
        {:error, "Your password doesn't match the username #{username}."}
      true ->
        dummy_checkpw()
        {:error, "We couldn't find a user with the usernane #{username}."}
    end    
  end
end