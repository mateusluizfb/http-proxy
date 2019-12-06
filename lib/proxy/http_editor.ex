defmodule HttpEditor do
  def edit_headers(headers) do
    # new_headers = Enum.filter(headers, fn header ->
    #   (elem(header, 0) != "Content-Encoding")
    # end)

    # IO.puts "NEW HEADERS"
    # IO.inspect new_headers
    # new_headers
  end

  def edit_body(body) do
    IO.inspect body
    String.replace(body, "h3", "h6")
  end
end
