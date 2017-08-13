defmodule GlobalRegistry.Registry do
  use Supervisor

  alias GlobalRegistry.Worker

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, name: {:global, __MODULE__})
  end

  def start_worker(name) do
    Supervisor.start_child({:global, __MODULE__}, [name])
  end

  def init(:ok) do
    children = Supervisor.child_spec(Worker, start: {Worker, :start_link, []})

    Supervisor.init([children], strategy: :simple_one_for_one)
  end
end
