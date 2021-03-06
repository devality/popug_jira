defmodule PopugJira.Repo do
  use Ecto.Repo,
    otp_app: :popug_jira,
    adapter: Ecto.Adapters.Postgres
end
