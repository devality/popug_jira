defmodule PopugJira.Models.Task do
  use Ecto.Schema

  schema "tasks" do
    field :name,    :string
    field :state,    :string

    timestamps()
  end
end
