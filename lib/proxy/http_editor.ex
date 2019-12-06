defmodule HttpEditor do
  def edit_headers(headers) do
    # new_headers = Enum.filter(headers, fn header ->
    #   (elem(header, 0) != "Content-Encoding")
    # end)

    # IO.puts "NEW HEADERS"
    # IO.inspect new_headers
    # new_headers
  end

  def edit_body(binary_body) do
    IO.inspect binary_body
    # raw_body = :unicode.characters_to_list(binary_body, {:utf16, :little})
    # IO.inspect raw_body
  end
end
