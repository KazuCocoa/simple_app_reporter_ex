
[![Build Status](https://travis-ci.org/KazuCocoa/simple_app_reporter_ex.svg?branch=master)](https://travis-ci.org/KazuCocoa/simple_app_reporter_ex)

# About

`Reporter` is simple reporting App reviews library.
Support AppStore and GooglePlay.

Hex is [here](https://hex.pm/packages/reporter)

Doc is [here](http://hexdocs.pm/reporter/extra-api-reference.html)

## Installation

First, add Reporter to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:reporter, "~> 0.5.3"}
  ]
end
```

and run `$ mix deps.get`.

# Usage
### Getting reviews from AppStore
#### JSON

```elixir
# The following method provide us very useful summary.
# You can get reviewed date, author, rating, title and body as Map.
iex> Reporter.app_store_rss_json!("375380948", "jp") |> Reporter.AppStore.review_summaries |> Enum.at(0)
%{"author" => "m.aaa...", "rating" => "4", "title" => "あまり", "body" => "利便性がわかりずらい"}


iex> Reporter.app_store_rss_json!("375380948", "jp")
     |> Reporter.AppStore.author
%{"name" => %{"label" => "iTunes Store"},
  "uri" => %{"label" => "http://www.apple.com/jp/itunes/"}}

iex> Reporter.app_store_rss_json!("375380948", "jp") |> Reporter.AppStore.reviews |> Enum.at(0)
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
iex> Reporter.app_store_rss_json!("375380948", "jp")
     |> Reporter.AppStore.all_json

# Return full JSON.
```

#### XML

Only implemented getting parsed XML.

```elixir
iex> Reporter.app_store_rss_xml!("375380948", "jp")
     |> Reporter.AppStore.all_xml

# Return XML based on FeederEx.
```

### Getting reviews from GooglePlay

```elixir
# The following method provide us very useful summary.
# You can get reviewed date, author, rating, title and body as Map.
iex> Reporter.google_play!("com.android.chrome", "en") |> Reporter.GooglePlay.review_summaries |> Enum.at(0)
%{"author" => "Kinoshanth Kino",
  "author_link" => "https://play.google.com/store/people/details?id=108550484713070099642",
  "body" => " It's really nice ",
  "date" => "May 22, 2016",
  "id" => "gp:AOqpTOHxPPI_l4M7AQy0djAtdTgDlgJUASN_rzS9tSelR6bQfN4cwRtYFNqjzTzzJX_qJeTXwQkNW4Ucsn1eJFk",
  "permalink" => "https://play.google.com/store/apps/details?id=com.android.chrome&reviewId=Z3A6QU9xcFRPSHhQUElfbDRNN0FReTBkakF0ZFRnRGxnSlVBU05fcnpTOXRTZWxSNmJRZk40Y3dSdFlGTnFqelR6ekpYX3FKZVRYd1FrTlc0VWNzbjFlSkZr",
  "rating" => 5.0,
  "title" => "Good"}

iex> Reporter.google_play!("com.android.chrome", "en") |> Reporter.GooglePlay.review_body_list |> Enum.at(0)
" Crashing a lot lot lot😡😣 "

iex> Reporter.google_play!("com.android.chrome", "en") |> Reporter.GooglePlay.review_bodies |> Enum.at(1)
{"div", [{"class", "review-body"}],
 [{"span", [{"class", "review-title"}], ["Not bad"]},
  " Unable to download from chrome. ",
  {"div", [{"class", "review-link"}, {"style", "display:none"}],
   [{"a",
     [{"class", "id-no-nav play-button tiny"}, {"href", "#"},
      {"target", "_blank"}], [" Full Review "]}]}]}
```

# Customize app store url and google play one

Generate `config/config.exs` and put the followings.

```
use Mix.Config

config :reporter,
  app_host: "https://itunes.apple.com",
  play_host: "https://play.google.com"
```

# LICENSE
license is MIT
