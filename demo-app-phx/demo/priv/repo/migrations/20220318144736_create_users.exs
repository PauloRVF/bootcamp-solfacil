defmodule Demo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nome, :string
      add :email, :string
      add :senha, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end
  end
end
