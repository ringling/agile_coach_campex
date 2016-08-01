defmodule AgileCoachCampex.Mixfile do
  use Mix.Project

  def project do
    [app: :agile_coach_campex,
     version: "1.0.2",
     elixir: "~> 1.3.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {AgileCoachCampex, []},
     applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: app_list
  defp app_list(_), do: app_list
  defp app_list, do: [
    :phoenix,
    :phoenix_html,
    :cowboy,
    :logger,
    :phoenix_ecto,
    :postgrex,
    :mailman,
    :eiconv
  ]


  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 1.2.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_ecto, "~> 2.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.9"},
      {:cowboy, "~> 1.0"},
      {:mailman, "~> 0.2.2"},
      {:cowboy, "~> 1.0"},
      {:eiconv, github: "zotonic/eiconv"}
    ]
  end


end
