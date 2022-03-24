defmodule Mydemo.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :email, :string
      add :password, :string
      add :admin, :boolean, default: true, null: false

      timestamps()
    end
  end
end
