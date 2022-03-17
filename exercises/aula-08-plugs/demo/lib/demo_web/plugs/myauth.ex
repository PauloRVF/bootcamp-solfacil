defmodule DemoWeb.Plugs.MyAuth do
  import Plug.Conn

  @authorized_users [
    %{user: "paulo", password: "123"},
    %{user: "debora", password: "123"},
    %{user: "luiz", password: "123"},
    %{user: "vinicius", password: "123"}
  ]

  def is_authorized?(user, password) do
    @authorized_users
    |> Enum.count(fn elem ->
      elem.user == user and elem.password == password
    end) > 0
  end

  def init(options), do: options

  def call(%{req_headers: headers} = conn, _opts) do
    headers = Map.new(headers)
    user = Map.get(headers, "user")
    password = Map.get(headers, "password")

    if is_authorized?(user, password) do
      conn
    else
      conn
      |> halt()
    end
  end
end
