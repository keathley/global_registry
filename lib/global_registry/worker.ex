defmodule GlobalRegistry.Worker do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: {:global, name})
  end

  def set(name, state), do: GenServer.call({:global, name}, {:set, state})

  def get(name), do: GenServer.call({:global, name}, :get)

  def init(:ok) do
    {:ok, :ok}
  end

  def handle_call(:get, _from, state), do: {:reply, {:ok, state}, state}
  def handle_call({:set, state}, _from, _), do: {:reply, {:ok, state}, state}

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
