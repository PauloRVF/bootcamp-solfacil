defmodule Demo.Repo.Migrations.CreateBlogposts do
  use Ecto.Migration

  def change do
    create table(:blogposts) do
      add :titulo, :string
      add :conteudo, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:blogposts, [:user_id])
  end
end
