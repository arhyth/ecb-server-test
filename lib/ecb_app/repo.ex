defmodule EcbApp.Repo do
  use Ecto.Repo,
    otp_app: :ecb_app,
    adapter: Ecto.Adapters.Postgres
end
