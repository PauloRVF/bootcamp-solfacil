defmodule DemoWeb.Plugs.Myauth do
  import Plug.Conn

  @authorized_users [
    %{user: "paulo", password: "123"},
    %{user: "debora", password: "123"},
    %{user: "luiz", password: "123"},
    %{user: "vinicius", password: "123"}
  ]

  defp authorized(user) when user in @authorized_users, do: {:ok, user}
  defp authorized(_), do: {:error, "User not authenticated"}

  defp get_user(conn) do
    %{
      user: hd(get_req_header(conn, "user")),
      password: hd(get_req_header(conn, "password"))
    }
  end

  def init(options), do: options

  def call(conn, _opts) do
    user = get_user(conn)

    case authorized(user) do
      {:ok, user} ->
        conn
        |> assign(:user_auth, user)

      {:error, reason} ->
        conn
        |> send_resp(401, "ERROR: #{reason}")
        |> halt()
    end
  end
end
