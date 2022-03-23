defmodule DemoWeb.Api.UserController do
  use DemoWeb, :controller
  alias Demo.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id} = _params) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def create(conn, %{"user" => user} = _params) do
    case Accounts.create_user(user) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> send_resp(:bad_request, "ERROR: #{inspect(changeset.errors)}")
        |> halt()
    end
  end
end
