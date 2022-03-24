defmodule Mydemo.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w/name email password admin/a
  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :admin, :boolean

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(:email)
  end
end
