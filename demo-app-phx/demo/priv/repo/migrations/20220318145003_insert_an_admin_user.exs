defmodule Demo.Repo.Migrations.InsertAnAdminUser do
  use Ecto.Migration
  alias Demo.Repo

  def change do
    Demo.Accounts.User.changeset(%Demo.Accounts.User{}, %{nome: "Admin", email: "admin@email.com.br", senha: "myPass*123", admin: true})
    |> Repo.insert!()
  end
end
