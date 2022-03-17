defmodule DemoWeb.Plugs.Mylogger do
  import Plug.Conn

  @filtered_information ["password", "cookie"]

  def init(options), do: options

  defp filter_sensitive_information(list_of_tuples) do
    Enum.filter(list_of_tuples, fn {elem1, _} ->
      elem1 not in @filtered_information
    end)
  end

  def call(%Plug.Conn{method: method, host: host, query_string: query_string, req_headers: headers, body_params: body} = conn, _opts) do
    IO.puts("METHOD:#{method}")
    IO.puts("HOST:#{host}")
    IO.puts("QUERY_STR:#{query_string}")
    IO.inspect(filter_sensitive_information(headers), label: "HEADERS")
    IO.inspect(body, label: "BODY")

    conn
  end
end
