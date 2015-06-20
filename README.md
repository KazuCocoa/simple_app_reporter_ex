Reporter
========

## Usage

Poison.Parser.parse!(json)["feed"]["entry"]
|> Enum.drop(1)

|> Enum.each(fn(item) -> IO.inspect("#{item["im:rating"]["label"]}, #{item["content"]["label"]}") end)

### Getting review of AppStore
#### JSON

```elixir
iex> Reporter.app_store_rss_json("375380948", "jp")
     |> Reporter.AppStore.author
%{"name" => %{"label" => "iTunes Store"},
  "uri" => %{"label" => "http://www.apple.com/jp/itunes/"}}
```

```elixir
iex> Reporter.app_store_rss_json("375380948", "jp")
     |> Reporter.AppStore.all

# Return full JSON.
```

#### XML

Only implemented xml body.

```elixir
iex> Reporter.app_store_rss_xml("375380948", "jp")

# Return HTTP body.
```
