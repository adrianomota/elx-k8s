defmodule ElxK8s.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElxK8s.Repo,
      # Start the Telemetry supervisor
      ElxK8sWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElxK8s.PubSub},
      # Start the Endpoint (http/https)
      ElxK8sWeb.Endpoint
      # Start a worker by calling: ElxK8s.Worker.start_link(arg)
      # {ElxK8s.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElxK8s.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElxK8sWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
