defmodule PhoenixVueWeb.ChangesetView do
  use PhoenixVueWeb, :view
  alias Ecto.Changeset
  
  @doc """
  Render Errors
  """
  def render("error.json", %{changeset: changeset}) do
    %{errors: Changeset.traverse_errors(changeset, &error_formatter/1)}
  end

  defp error_formatter({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
