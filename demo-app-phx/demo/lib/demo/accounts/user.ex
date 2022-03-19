defmodule Demo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :nome, :string
    field :senha, :string
    has_many :posts, Demo.Blogposts.Blogpost

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nome, :email, :senha, :admin])
    |> validate_required([:nome, :email, :senha, :admin])
  end
end
