defmodule Demo.Blogposts.Blogpost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogposts" do
    field :conteudo, :string
    field :titulo, :string
    field :ativo, :boolean
    #field :user_id, :id
    belongs_to :user, Demo.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(blogpost, attrs) do
    blogpost
    |> cast(attrs, [:titulo, :conteudo])
    |> validate_required([:titulo, :conteudo])
  end
end
