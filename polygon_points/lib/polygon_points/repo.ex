defmodule PolygonPoints.Repo do
  use Ecto.Repo,
    otp_app: :polygon_points,
    adapter: Ecto.Adapters.Postgres
end
