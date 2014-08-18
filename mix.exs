defmodule WebAssembly.Mixfile do
  use Mix.Project

  def project do
    [app: :webassembly,
     version: "0.3.2",
     elixir: "~> 0.15.0",
     deps: deps,
     description: description,
     package: package,
     test_coverage: [tool: ExCoveralls]]
  end

  def application do
    [applications: [],
      description: 'Web DSL']
  end

  defp deps do
    [{:excoveralls, "~> 0.3.2", only: :test}]
  end

  defp description do
    ~S"""
    WebAssembly is a web DSL for Elixir.

    You create html structure straight using do blocks.
    Means, you can intermix html-building blocks with full Elixir syntax:

        div class: "container" do
          n = get_the_size
          if n > 1 do
            ul do
              for index <- 1..n, do:
                li "item #{index}"
            end
          else
            span "got only one item"
          end
        end

    DSL output is an iolist, which you can flatten to string, but
    better use is to feed it to the socket (via Plug & Cowboy).

    WebAssembly aims to have 100% test coverage.
    """
  end

  defp package do
    [ contributors: ["Wojciech Kaczmarek"],
      licenses: ["BSD"],
      description: description,
      links: %{"GitHub" => "https://github.com/herenowcoder/webassembly"}
    ]
  end
end
