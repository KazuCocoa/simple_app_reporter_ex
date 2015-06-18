defmodule Reporter.Mixfile do
  use Mix.Project

  def project do
    [app: :reporter,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [
      applications: [:logger, :poison]
    ]
  end

  defp deps do
    [
      {:poison, "~> 1.4.0"}
    ]
  end
end
