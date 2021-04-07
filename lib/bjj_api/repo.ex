defmodule BJJ.Repo do
  use Ecto.Repo,
    otp_app: :bjj_api,
    adapter: Ecto.Adapters.Postgres
end
