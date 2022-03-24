defmodule Mydemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mydemo.Repo,
      # Start the Telemetry supervisor
      MydemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mydemo.PubSub},
      # Start the Endpoint (http/https)
      MydemoWeb.Endpoint
      # Start a worker by calling: Mydemo.Worker.start_link(arg)
      # {Mydemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mydemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MydemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
