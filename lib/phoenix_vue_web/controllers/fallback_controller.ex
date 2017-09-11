defmodule PhoenixVueWeb.FallbackController do
  use PhoenixVueWeb, :controller
  alias Ecto.Changeset

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PhoenixVueWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(PhoenixVueWeb.ErrorView, :"404")
  end  
 
end