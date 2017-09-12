defmodule PhoenixVue.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :phoenix_vue

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
end