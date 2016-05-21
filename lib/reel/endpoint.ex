defmodule Reel.Endpoint do
  use Phoenix.Endpoint, otp_app: :reel

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
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
