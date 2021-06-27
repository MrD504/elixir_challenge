defmodule BlackJack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BlackJackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BlackJack.PubSub},
      # Start the Endpoint (http/https)
      BlackJackWeb.Endpoint
      # Start a worker by calling: BlackJack.Worker.start_link(arg)
      # {BlackJack.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlackJack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BlackJackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
