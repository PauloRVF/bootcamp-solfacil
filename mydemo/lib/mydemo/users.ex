defmodule Mydemo.Users do
  alias Mydemo.Repo
  alias Mydemo.Users.User

  def list_users, do: Repo.all(User)

  def create_user!(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert!()
  end

  def get_user!(id), do: Repo.get!(User, id)

  def update_user!(%User{} = user, attr) do
    user
    |> User.changeset(attr)
    |> Repo.update!()
  end

  def delete_user!(user), do: Repo.delete!(user)
end
