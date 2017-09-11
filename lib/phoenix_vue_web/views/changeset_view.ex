defmodule PhoenixVueWeb.ChangesetView do
  use PhoenixVueWeb, :view

  @doc """
  Render Errors
  """
  def render("error.json", %{changeset: changeset}) do
    %{errors: changeset}
  end
end
