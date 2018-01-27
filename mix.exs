defmodule Bamboo.Sendcloud.Mixfile do
  use Mix.Project

  @version "0.2.0"
  @project_url "https://github.com/linjunpop/bamboo_sendcloud"

  def project do
    [
      app: :bamboo_sendcloud,
      version: @version,
      elixir: "~> 1.4",
      source_url: @project_url,
      homepage_url: @project_url,
      name: "Bamboo Sendcloud Adapter",
      description: "A Bamboo adapter for Sendcloud",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:bamboo, "~> 0.5"},
      {:hackney, "~> 1.6"},
      {:poison, ">= 1.5.0"},
      {:plug, "~> 1.0"},
      {:cowboy, "~> 1.0", only: [:test, :dev]},
      {:ex_doc, "~> 0.13", only: :dev},
      {:credo, "~> 0.7", only: [:dev, :test]},
      {:exvcr, "~> 0.8", only: :test}
    ]
  end

  defp package do
    [
      maintainers: ["Jun Lin"],
      licenses: ["MIT"],
      links: %{"GitHub" => @project_url}
    ]
  end
end
