defmodule HttpEditorTest do
  use ExUnit.Case
  doctest Proxy

  test "the truth" do
    body = "<h3> Olar </h3>"
    assert "<h6> Olar </h6>" == HttpEditor.edit_body(body)
  end
end
