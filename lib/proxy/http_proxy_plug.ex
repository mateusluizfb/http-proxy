defmodule Proxy.HttpProxyPlug do
  import Plug.Conn
  alias Proxy.{Cache, Utils}

  def init(opts), do: opts

  def call(conn, _opts) do
    url = Utils.build_url conn
    body = Utils.build_body conn
    method = String.to_atom(conn.method)

    conn = put_req_header(conn, "accept-encoding", "identity")
    IO.puts "REQUEST HEADERS"
    IO.inspect conn.req_headers

    case HTTPoison.request(method, url, body, conn.req_headers) do
      {:ok, resp} ->
        # headers = List.keydelete resp.headers, "Transfer-Encoding", 0
        # HttpEditor.edit_headers(headers)
        IO.inspect resp
        HttpEditor.edit_body(resp.body)

        #if method == :GET do
          # Cache GET requests only
        #  Cache.insert(url, %{resp | headers: headers})
        #end

        %{conn | resp_headers: resp.headers}
          |> send_resp(resp.status_code, resp.body)

      {:error, reason} ->
        conn
        |> send_resp(500, reason)
    end
  end

end
