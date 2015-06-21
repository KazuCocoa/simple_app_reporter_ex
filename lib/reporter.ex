defmodule Reporter do

  alias Reporter.AppStore
  alias Reporter.GooglePlay

  @doc """
  Get JSON formatted response from Apple Server.
  """
  @spec app_store_rss_json(String.t, String.t) :: JSON
  def app_store_rss_json(app_id, locate \\ "en"), do: get_body(HTTPoison.get(AppStore.rss_json(app_id, locate)))

  @doc """
  Get XML formatted response from Apple Server.
  """
  @spec app_store_rss_xml(String.t, String.t) :: XML
  def app_store_rss_xml(app_id, locate \\ "en"), do: get_body(HTTPoison.get(AppStore.rss_xml(app_id, locate)))

  @doc """
  Get XML formatted response from GooglePlay.
  """
  @spec google_play() :: String.t
  def google_play() do
    get_body(HTTPoison.post(GooglePlay.review_url("com.android.chrome", "jp"), ""))
  end

  defp get_body(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        ~s({"status_code": "404", "message": "not found."})
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
