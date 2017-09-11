defmodule PhoenixVue.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixVue.User


  schema "users" do
    field :password_hash, :string
    field :password, :string, virtual: true    
    field :username, :string

    timestamps()
  end

  @doc """
    Used for registering a user
  """
  def registeration_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password_hash])
    |> validate_required([:username, :password_hash])
    |> validate_length(:password, min: 6, max: 20)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
                      changes: %{password: password}} ->
        put_change(changeset,
                   :password_hash,
                   Comeonin.Bcrypt.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end  
end
