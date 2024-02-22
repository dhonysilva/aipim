defmodule Aipim.Repo do
  use Ecto.Repo,
    otp_app: :aipim,
    adapter: Ecto.Adapters.Postgres
end
