defmodule Demo.Repo.Migrations.InsertAnAdminUser do
  use Ecto.Migration
  alias Demo.Repo
  alias Demo.Accounts.User

  def change do
    Repo.insert_all(User, [
      [
        nome: "Admin",
        email: "admin@email.com.br",
        senha: "myPass*123",
        admin: true,
        inserted_at: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second),
        updated_at: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second),
      ]
    ])
  end
end
