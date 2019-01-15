defmodule EcbServerTest.Repo do
  use Ecto.Repo,
    otp_app: :ecb_server_test,
    adapter: Ecto.Adapters.Postgres
end
