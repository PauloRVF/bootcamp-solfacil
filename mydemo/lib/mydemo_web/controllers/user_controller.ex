defmodule MydemoWeb.UserController do
  use MydemoWeb, :controller
  alias Mydemo.Users

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id} = _params) do
    render(conn, "show.json", user: Users.get_user!(id))
  end

  def create(conn, %{"user" => user} = _params) do
    user = Users.create_user!(user)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"user" => user, "id" => id} = _params) do
    old_user = Users.get_user!(id)
    user = Users.update_user!(old_user, user)
    render(conn, "show.json", user: user)
  end

  def delete(conn, %{"id" => id} = _params) do
    user = Users.get_user!(id)
    Users.delete_user!(user)

    conn
    |> send_resp(:no_content, "")
  end
end
