defmodule Proxy.HttpProxyPlug do
  import Plug.Conn
  alias Proxy.{Cache, Utils}

  def init(opts), do: opts

  def call(conn, _opts) do
    url = Utils.build_url conn
    body = Utils.build_body conn
    method = String.to_atom(conn.method)
    conn = put_req_header(conn, "accept-encoding", "identity")
    request(method, url, body, conn)
  end

  def request(method, url, body, conn) do
    case HTTPoison.request(method, url, body, conn.req_headers) do
      {:ok, resp} ->
        # new_headers = HttpEditor.edit_headers(headers)
        new_body = HttpEditor.edit_body(resp.body)

        send_resp(
          %{ conn | resp_headers: resp.headers },
          resp.status_code,
          new_body
        )
      {:error, reason} ->
        conn
        |> send_resp(500, reason)
    end
  end

end
