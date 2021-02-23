defmodule DeliverRx.Repo do
  use Ecto.Repo,
    otp_app: :deliverRx,
    adapter: Ecto.Adapters.Postgres
end
