# About

`Reporter` is simple reporting App reviews library.
Support AppStore and GooglePlay.

Hex is [here](https://hex.pm/packages/reporter)

## Installation

First, add Reporter to your `mix.exs` dependencies:

```elixir
def deps do
  [{:reporter, "~> 0.1.2"}]
end
```

and run `$ mix deps.get`.

# Usage
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

```elixir

# The following method provide us very useful summary.
# You can get reviewed date, author, rating, title and body as List.
iex> Reporter.google_play("com.android.chrome", "jp") |> Reporter.GooglePlay.review_summaries |> Enum.at(0)
[date: "2015年6月20日", author: "森本真治", rating: 1.0,
 title: "不具合多すぎ",
 body: " 戻るがきかない、軽いのがうりなのにどんどん重くなるなど微妙につかえないブラウザになってます…数ヶ月まったく治らないのでいい加減見限ろうかと。 "]


iex> Reporter.google_play("com.android.chrome", "jp") |> Reporter.GooglePlay.review_body_list |> Enum.at(0)
" 戻るがきかない、軽いのがうりなのにどんどん重くなるなど微妙につかえないブラウザになってます…数ヶ月まったく治らないのでいい加減見限ろうかと。 "

iex> Reporter.google_play("com.android.chrome", "jp") |> Reporter.GooglePlay.review_bodies |> Enum.at(1)
{"div", [{"class", "review-body"}],
  [{"span", [{"class", "review-title"}], ["Android5版"]},
  " なぜか「すべてのタブを閉じる」がありません。それ以外は満足です。 ",
  {"div", [{"class", "review-link"}, {"style", "display:none"}],
    [{"a",
    [{"class", "id-no-nav play-button tiny"}, {"href", "#"},
      {"target", "_blank"}], ["全文を表示"]}]}]}

```

# LICENSE
license is MIT
