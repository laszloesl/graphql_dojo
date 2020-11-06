defmodule GraphqlDojo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      GraphqlDojoWeb.Telemetry,
      {Phoenix.PubSub, name: GraphqlDojo.PubSub},
      GraphqlDojoWeb.Endpoint,
      {GraphqlDojo.Database, []}
    ]

    opts = [strategy: :one_for_one, name: GraphqlDojo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GraphqlDojoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
