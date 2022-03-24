defmodule Mydemo.Repo do
  use Ecto.Repo,
    otp_app: :mydemo,
    adapter: Ecto.Adapters.Postgres
end
