defmodule PhoenixVue.Web.FallbackController do
  use PhoenixVue.Web, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PhoenixVue.Web.ChangesetView, "error.json", changeset: changeset)
  end
 
end