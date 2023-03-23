defmodule Vtigrex.MixProject do
  use Mix.Project

  @version "0.1.0"

  @description "vtiger Rest API wrapper"
  @source_url "https://github.com/fuww/vtigrex"

  def project do
    [
      app: :vtigrex,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs"
      ],
      description: @description,
      package: package(),
      docs: [
        source_ref: "v#{@version}",
        main: "Vtigrex",
        source_url: @source_url
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.5"},
      {:jason, "~> 1.4"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.29.3", only: [:dev], runtime: false},
      {:credo, "~> 1.7", only: [:dev], runtime: false}
    ]
  end

  def package do
    [
      maintainers: ["Péter Pál Koszta"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
