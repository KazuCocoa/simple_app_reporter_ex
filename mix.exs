defmodule Reporter.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.strip

  def project do
    [
      app: :reporter,
      version: @version,
      elixir: "~> 1.1",
      name: "Reporter",
      source_url: "https://github.com/KazuCocoa/simple_app_reporter_ex",
      description: "Simple getting reviews library from AppStore and GooglePlay",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      package: package
     ]
  end

  def application do
    [
      applications: [:httpoison, :poison]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8"},
      # {:certifi, "~> 0.4.0"}, # because certifi 0.7.0 failed to extablish connection with SSL
      {:poison, "~> 3.0"},
      {:feeder_ex, "~> 1.0"},
      {:floki, "~> 0.8"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:dialyze, "~> 0.2.0", only: :dev}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE VERSION),
      maintainers: ["Kazuaki Matsuo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KazuCocoa/simple_app_reporter_ex"}
    ]
  end
end
