defmodule AppBasica.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AppBasicaWeb.Telemetry,
      AppBasica.Repo,
      {DNSCluster, query: Application.get_env(:app_basica, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AppBasica.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AppBasica.Finch},
      # Start a worker by calling: AppBasica.Worker.start_link(arg)
      # {AppBasica.Worker, arg},
      # Start to serve requests, typically the last entry
      AppBasicaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AppBasica.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AppBasicaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
