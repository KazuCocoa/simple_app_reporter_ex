defmodule Reporter.AppStore do
  alias Reporter.AppStore

  defstruct host: Application.get_env(:reporter, :app_host)

  @doc """
  Return full JSON map.
  """
  def all_json(json) do
    Poison.Parser.parse!(json)
  end

  @doc """
  Return full XML via Quinn.parse(xml).
  """
  def all_xml(xml) do
    Quinn.parse(xml)
  end

  @doc ~S"""
  Returns collection of reviews.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.author
    %{"name" => %{"label" => "iTunes Store"},
      "uri" => %{"label" => "http://www.apple.com/jp/itunes/"}}

  """
  def author(json) do
    Poison.Parser.parse!(json)["feed"]["author"]
  end


  @doc ~S"""
  Returns collection of reviews.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.entry
    %{"category" => %{"attributes" => %{"im:id" => "6012",
          "label" => "ライフスタイル",
          "scheme" => "https://itunes.apple.com/jp/genre/ios-raifusutairu/id6012?mt=8&uo=2",
          "term" => "Lifestyle"}},
      "id" => %{"attributes" => %{"im:bundleId" => "com.apple.store.Jolly",
          "im:id" => "375380948"},
        "label" => "https://itunes.apple.com/jp/app/apple-store/id375380948?mt=8&uo=2"},
      "im:artist" => %{"attributes" => %{"href" => "https://itunes.apple.com/jp/artist/apple/id284417353?mt=8&uo=2"},
        "label" => "Apple"},
      "im:contentType" => %{"attributes" => %{"label" => "アプリケーション",
          "term" => "Application"}},
      "im:image" => [%{"attributes" => %{"height" => "53"},
         "label" => "http://is5.mzstatic.com/image/pf/us/r30/Purple1/v4/82/bd/90/82bd90c7-f673-718c-7c32-ad9db7591ea6/mzl.hfuxogmw.53x53-50.png"},
       %{"attributes" => %{"height" => "75"},
         "label" => "http://is1.mzstatic.com/image/pf/us/r30/Purple1/v4/82/bd/90/82bd90c7-f673-718c-7c32-ad9db7591ea6/mzl.hfuxogmw.75x75-65.png"},
       %{"attributes" => %{"height" => "100"},
         "label" => "http://is3.mzstatic.com/image/pf/us/r30/Purple1/v4/82/bd/90/82bd90c7-f673-718c-7c32-ad9db7591ea6/mzl.hfuxogmw.100x100-75.png"}],
      "im:name" => %{"label" => "Apple Store"},
      "im:price" => %{"attributes" => %{"amount" => "0.00000", "currency" => "JPY"},
        "label" => "入手"},
      "im:releaseDate" => %{"attributes" => %{"label" => "2011年9月21日"},
        "label" => "2011-09-21T10:10:33-07:00"},
      "link" => %{"attributes" => %{"href" => "https://itunes.apple.com/jp/app/apple-store/id375380948?mt=8&uo=2",
          "rel" => "alternate", "type" => "text/html"}},
      "rights" => %{"label" => "© 2015 Apple Inc."},
      "title" => %{"label" => "Apple Store - Apple"}}

  """
  def entry(json) do
    Poison.Parser.parse!(json)["feed"]["entry"]
    |> Enum.at(0)
  end

  @doc ~S"""
  Returns collection of reviews.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.reviews |> Enum.at(0)
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

  """
  def reviews(json) do
    Poison.Parser.parse!(json)["feed"]["entry"]
    |> Enum.drop(1)
  end

  @doc ~S"""
  Returns icon.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.icon
    %{"label" => "http://itunes.apple.com/favicon.ico"}

  """
  def icon(json) do
    Poison.Parser.parse!(json)["feed"]["icon"]
  end

  @doc ~S"""
  Returns id.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.id
    %{"label" => "https://itunes.apple.com/jp/rss/customerreviews/id=375380948/sortby=mostrecent/json"}

  """
  def id(json) do
    Poison.Parser.parse!(json)["feed"]["id"]
  end

  @doc ~S"""
  Returns collection of link.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.link
    [%{"attributes" => %{"href" => "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewGrouping?cc=jp&id=26105",
                    "rel" => "alternate", "type" => "text/html"}},
                %{"attributes" => %{"href" => "https://itunes.apple.com/jp/rss/customerreviews/id=375380948/sortby=mostrecent/json",
                    "rel" => "self"}},
                %{"attributes" => %{"href" => "https://itunes.apple.com/jp/rss/customerreviews/page=1/id=375380948/sortby=mostrecent/xml?urlDesc=/customerreviews/id=375380948/sortby=mostrecent/json",
                    "rel" => "first"}},
                %{"attributes" => %{"href" => "https://itunes.apple.com/jp/rss/customerreviews/page=8/id=375380948/sortby=mostrecent/xml?urlDesc=/customerreviews/id=375380948/sortby=mostrecent/json",
                    "rel" => "last"}},
                %{"attributes" => %{"href" => "https://itunes.apple.com/jp/rss/customerreviews/page=1/id=375380948/sortby=mostrecent/xml?urlDesc=/customerreviews/id=375380948/sortby=mostrecent/json",
                    "rel" => "previous"}},
                %{"attributes" => %{"href" => "https://itunes.apple.com/jp/rss/customerreviews/page=2/id=375380948/sortby=mostrecent/xml?urlDesc=/customerreviews/id=375380948/sortby=mostrecent/json",
                    "rel" => "next"}}]

  """
  def link(json) do
    Poison.Parser.parse!(json)["feed"]["link"]
  end

  @doc ~S"""
  Returns rights.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.rights
    %{"label" => "Copyright 2008 Apple Inc."}

  """
  def rights(json) do
    Poison.Parser.parse!(json)["feed"]["rights"]
  end

  @doc ~S"""
  Returns collection of title.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.title
    %{"label" => "iTunes Store: カスタマーレビュー"}

  """
  def title(json) do
    Poison.Parser.parse!(json)["feed"]["title"]
  end


  @doc ~S"""
  Returns time of updated.

  ## Examples

    iex> File.read!("./test/data/ios_review.json") |> Reporter.AppStore.updated
    %{"label" => "2015-06-18T07:17:49-07:00"}

  """
  def updated(json) do
    Poison.Parser.parse!(json)["feed"]["updated"]
  end


  @doc ~S"""
  Return URLs with JSON.

  ## Examples

    iex> Reporter.AppStore.rss_json("375380948")
    "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/json"

    iex> Reporter.AppStore.rss_json("375380948", "jp")
    "https://itunes.apple.com/jp/rss/customerreviews/id=375380948/sortby=mostrecent/json"
  """
  @spec rss_json(String.t, String.t) :: String.t
  def rss_json(app_id, locale \\ "en") do
    rss(app_id, locale, "json")
  end

  @doc ~S"""
  Return URLs with XML.

  ## Examples

    iex> Reporter.AppStore.rss_xml("375380948")
    "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/xml"

    iex> Reporter.AppStore.rss_xml("375380948", "jp")
    "https://itunes.apple.com/jp/rss/customerreviews/id=375380948/sortby=mostrecent/xml"
  """
  @spec rss_xml(String.t, String.t) :: String.t
  def rss_xml(app_id, locale \\ "en") do
    rss(app_id, locale, "xml")
  end

  defp rss(app_id, locale, format) do
    Enum.join([
      %AppStore{}.host,
      "/",
      locale,
      "/rss/customerreviews/id=",
      app_id,
      "/sortby=mostrecent/",
      format
      ]
    )
  end
end
