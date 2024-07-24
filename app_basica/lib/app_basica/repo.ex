defmodule AppBasica.Repo do
  use Ecto.Repo,
    otp_app: :app_basica,
    adapter: Ecto.Adapters.Postgres
end
