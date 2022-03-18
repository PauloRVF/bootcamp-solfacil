# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Demo.Repo.insert!(%Demo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Demo.Accounts

seeding_data = [
  %{nome: "Teste1", email: "email@email.com", senha: "123abc", admin: false},
  %{nome: "Teste2", email: "email2@email.com", senha: "123abc", admin: false}
]

Enum.each(seeding_data, &Accounts.create_user(&1))
