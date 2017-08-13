defmodule GlobalRegistry.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: GlobalRegistry.Worker.start_link(arg)
      {GlobalRegistry.Registry, []},
    ]

    opts = [strategy: :one_for_one, name: GlobalRegistry.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
