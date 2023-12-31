defmodule Sampler.Repo do
  use Ecto.Repo,
    otp_app: :sampler,
    adapter: Ecto.Adapters.Postgres
end
