defmodule Reporter.AppStore do
  alias Reporter.AppStore

  defstruct host: "https://itunes.apple.com",
            app_id: Application.get_env(:reporter, :app_id, "375380948"),
            rss_json: "/rss/customerreviews/id=#{Application.get_env(:reporter, :app_id, "375380948")}/sortby=mostrecent/json"

  @doc ~S"""
  Return URLs.

  ## Examples

    iex> Reporter.AppStore.app_urs_json
    "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/json"

    iex> Reporter.AppStore.app_urs_json("jp")
    "https://itunes.apple.com/jp/rss/customerreviews/id=375380948/sortby=mostrecent/json"
  """
  @spec app_urs_json(String.t) :: String.t
  def app_urs_json(locale \\ "en") do
    %AppStore{}.host <> "/" <> locale <> %AppStore{}.rss_json
  end
end
