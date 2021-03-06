defmodule PopugJiraWeb.TodoLive do
  use PopugJiraWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, list: [])}
  end
end
