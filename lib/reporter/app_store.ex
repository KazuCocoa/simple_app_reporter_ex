defmodule Reporter.AppStore do
  alias Reporter.AppStore

  defstruct host: Application.get_env(:reporter, :app_host),
            app_id: Application.get_env(:reporter, :app_id)

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
  @spec rss_json(String.t, String.t) :: String.t
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
