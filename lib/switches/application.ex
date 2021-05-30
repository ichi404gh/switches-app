defmodule Switches.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SwitchesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Switches.PubSub},
      # Start the Endpoint (http/https)
      SwitchesWeb.Endpoint,
      # Start a worker by calling: Switches.Worker.start_link(arg)
      {Switches.Handler, name: Switches.Handler}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Switches.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SwitchesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
