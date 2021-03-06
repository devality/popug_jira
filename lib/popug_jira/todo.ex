defmodule PopugJira.Todo do
  import Ecto.Query

  alias PopugJira.Models.Task
  alias PopugJira.Repo

  def index do
    Repo.all(from t in Task, order_by: [asc: :inserted_at])
  end

  def show(id) do
    Repo.get!(Task, id)
  end

  def create(name) do
    new_task = %Task{name: name, state: "open"}
    Repo.insert!( new_task)
  end

  def update(id, changes) do
    task = show(id)
    changeset = Ecto.Changeset.change(task, changes)
    Repo.update(changeset)
  end

  def delete(id) do
    task = show(id)
    Repo.delete!(task)
  end
end
