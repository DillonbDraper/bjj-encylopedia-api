defmodule BJJ.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BJJ.Repo,
      # Start the Telemetry supervisor
      BJJWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BJJ.PubSub},
      # Start the Endpoint (http/https)
      BJJWeb.Endpoint
      # Start a worker by calling: BJJ.Worker.start_link(arg)
      # {BJJ.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BJJ.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BJJWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
