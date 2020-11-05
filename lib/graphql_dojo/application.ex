defmodule GraphqlDojo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GraphqlDojoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GraphqlDojo.PubSub},
      # Start the Endpoint (http/https)
      GraphqlDojoWeb.Endpoint
      # Start a worker by calling: GraphqlDojo.Worker.start_link(arg)
      # {GraphqlDojo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GraphqlDojo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GraphqlDojoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
