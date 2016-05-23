defmodule Reel.PostResolver do
  require Logger

  def all(_args, _info) do
    _args |> inspect |> Logger.debug
    _info |> inspect |> Logger.debug
    {:ok, items}
  end

  defp items do
    [%{id: 123, title: "foo", body: "asdf"},
     %{id: 321, title: "bar", body: "qwer"}]
  end
end
