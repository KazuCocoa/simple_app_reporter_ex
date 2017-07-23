defmodule Reporter.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim

  def project do
    [
      app: :reporter,
      version: @version,
      elixir: "~> 1.4",
      name: "Reporter",
      source_url: "https://github.com/KazuCocoa/simple_app_reporter_ex",
      description: "Simple getting reviews library from AppStore and GooglePlay",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package()
     ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8"},
      {:poison, "~> 3.0"},
      {:feeder_ex, "~> 1.0", runtime: false},
      {:floki, "~> 0.8", runtime: false},
      {:earmark, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.11", only: :dev, runtime: false},
      {:dialyze, "~> 0.2.0", only: :dev, runtime: false}
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
