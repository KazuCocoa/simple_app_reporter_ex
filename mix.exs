defmodule Reporter.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.strip

  def project do
    [
      app: :reporter,
      version: @version,
      elixir: "~> 1.0",
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
      {:httpoison, "~> 0.7"},
      {:poison, "~> 1.5"},
      {:quinn, "~> 0.0.3"},
      {:floki, "~> 0.3"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev}
    ]
  end

  defp package do
    [
      files: ~w(lib config mix.exs README.md LICENSE VERSION),
      contributors: ["Kazuaki Matsuo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KazuCocoa/simple_app_reporter_ex"}
    ]
  end
end
