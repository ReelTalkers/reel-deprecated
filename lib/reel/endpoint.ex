defmodule Reel.Endpoint do
  use Phoenix.Endpoint, otp_app: :reel

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_reel_key",
    signing_salt: "PDgvaNY8"

  cond do
    Mix.env == :dev ->
      plug Absinthe.Plug.GraphiQL, schema: Reel.Schema
    true ->
      plug Absinthe.Plug, schema: Reel.Schema
  end
end
