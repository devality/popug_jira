defmodule PopugJiraWeb.TodoLive do
  use PopugJiraWeb, :live_view

  alias PopugJira.Todo

  @impl true
  def mount(_params, _session, socket) do
    tasks = Todo.index
    {:ok, assign(socket, tasks: tasks)}
  end

  @impl true
  def handle_event("create", %{"name" => name}, socket) do
    Todo.create(name)
    tasks = Todo.index

    {:noreply,
     socket
     |> assign(tasks: tasks)}
  end

  @impl true
  def handle_event("open", %{"id" => id}, socket) do
    update_task(id, "open", socket)
  end

  @impl true
  def handle_event("close", %{"id" => id}, socket) do
    update_task(id, "closed", socket)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    Todo.delete(id)
    tasks = Todo.index

    {:noreply,
     socket
     |> assign(tasks: tasks)}
  end

  defp update_task(id, state, socket) do
    Todo.update(id, %{state: state})
    tasks = Todo.index

    {:noreply,
     socket
     |> assign(tasks: tasks)}
  end
end
