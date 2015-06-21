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

iex> Reporter.app_store_rss_json("375380948", "jp") |> Reporter.AppStore.reviews |> Enum.at(0)
%{"author" => %{"label" => "", "name" => %{"label" => "m.aaa..."},
  "uri" => %{"label" => "https://itunes.apple.com/jp/reviews/id451145371"}},
  "content" => %{"attributes" => %{"type" => "text"},
  "label" => "利便性がわかりずらい"},
  "id" => %{"label" => "1205430410"},
  "im:contentType" => %{"attributes" => %{"label" => "アプリケーション",
  "term" => "Application"}}, "im:rating" => %{"label" => "4"},
  "im:version" => %{"label" => "3.3"}, "im:voteCount" => %{"label" => "0"},
  "im:voteSum" => %{"label" => "0"},
  "link" => %{"attributes" => %{"href" => "https://itunes.apple.com/jp/review?id=375380948&type=Purple%20Software",
  "rel" => "related"}}, "title" => %{"label" => "あまり"}}
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
