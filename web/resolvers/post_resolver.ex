defmodule Reel.PostResolver do

  def all(_args, _info) do
    {:ok, items}
  end

  defp items do
    [%{id: 123, title: "foo", body: "asdf"},
     %{id: 321, title: "bar", body: "qwer"}]
  end
end
