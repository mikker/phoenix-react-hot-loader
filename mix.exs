defmodule MyApp.Mixfile do
  use Mix.Project

  def project do
    [app: :my_app,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     aliases: ["phoenix.digest": ["my_app.digest", "phoenix.digest"]]]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {MyApp, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.3"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:phoenix_ecto, "~> 1.0"},
     {:postgrex, "~> 0.9"},
     {:phoenix_html, "~> 2.1"},
     {:cowboy, "~> 1.0"}]
  end
end
