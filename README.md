# About

`Reporter` is simple reporting App reviews library.
Support AppStore and GooglePlay.

## Installation

First, add Reporter to your `mix.exs` dependencies:

```elixir
def deps do
  [{:reporter, "~> 0.0.1"}]
end
```

and run `$ mix deps.get`.

## Usage
### Getting reviews from AppStore
#### JSON

```elixir
iex> Reporter.app_store_rss_json("375380948", "jp")
     |> Reporter.AppStore.author
%{"name" => %{"label" => "iTunes Store"},
  "uri" => %{"label" => "http://www.apple.com/jp/itunes/"}}
```

```elixir
iex> Reporter.app_store_rss_json("375380948", "jp")
     |> Reporter.AppStore.all_json

# Return full JSON.
```

#### XML

Only implemented getting parsed XML.

```elixir
iex> Reporter.app_store_rss_xml("375380948", "jp")
     |> Reporter.AppStore.all_xml

# Return HTTP body.
```

### Getting reviews from GooglePlay

Implementing...

# LICENSE
license is MIT
