defmodule PhoenixVueWeb.AuthView do
  use PhoenixVueWeb, :view

  def render("register.json", %{user: user}) do
    %{user: user_mapper(user)}
  end

  def render("login.json",  %{token: token, user_id: user_id}) do
    %{
      token: token,
      user_id: user_id
    }
  end

  def render("401.json", %{message: message}) do
    %{
      errors: [
        %{
          id: "UNAUTHORIZED",
          title: "401 Unauthorized",
          detail: message,
          status: 401,
        }
      ]
    }
  end

  def render("403.json", %{message: message}) do
    %{
      errors: [
        %{
          id: "FORBIDDEN",
          title: "403 Forbidden",
          detail: message,
          status: 403,
        }
      ]
    }
  end  

  defp user_mapper(user) do 
    %{
      username: user.username,
      created_at: user.inserted_at
    }
  end
end
