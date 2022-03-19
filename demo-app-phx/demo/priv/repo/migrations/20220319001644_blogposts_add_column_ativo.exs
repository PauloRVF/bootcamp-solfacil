defmodule Demo.Repo.Migrations.BlogpostsAddColumnAtivo do
  use Ecto.Migration

  def change do
    alter table(:blogposts) do
      add :ativo, :boolean, default: false, null: true
    end
  end
end
