defmodule DemoWeb.Plugs.Mylogger do
  import Plug.Conn

  @filtered_information ["password", "cookie", "token"]

  def init(options), do: options

  defp hidden_sensitive_information(term), do: Enum.map(term, &hidden_content/1)

  defp hidden_content({key, _} = content) when key not in @filtered_information, do: content
  defp hidden_content({key, value}), do: {key, String.pad_leading("", String.length(value), "*")}

  def call(conn, _opts) do
    log_info = %{
      "Method" => conn.method,
      "Host" => conn.host,
      "Query_String" => conn.query_string,
      "Headers" => hidden_sensitive_information(conn.req_headers),
      "Body" => conn.body_params
    }

    IO.inspect(log_info)
    conn
  end
end
