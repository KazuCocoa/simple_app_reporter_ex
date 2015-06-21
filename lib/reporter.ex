defmodule Reporter do

  alias Reporter.AppStore
  alias Reporter.GooglePlay

  @doc """
  Get JSON response decoded by Poison.decode! from Apple Server.

  error case
  ### Not found
  iex> error = %{"message" => "not found.", "status_code" => "404"}
  iex> error[:status_code]
  "404"

  """
  @spec app_store_rss_json(String.t, String.t) :: JSON
  def app_store_rss_json(app_id, locale \\ "en") do
    headers = [{"Accept", "application/json; charset=UTF-8"}]
    get_body_json(HTTPoison.get(AppStore.rss_json(app_id, locale), headers)) |> Poison.decode!
  end

  @doc """
  Get XML formatted response from Apple Server.
  """
  @spec app_store_rss_xml(String.t, String.t) :: XML
  def app_store_rss_xml(app_id, locale \\ "en") do
    headers = [{"Accept", "application/xml; charset=UTF-8"}]
    case get_body(HTTPoison.get(AppStore.rss_xml(app_id, locale), headers)) do
      {:ok, body} -> body
      {:error, body} -> body
    end
  end

  @doc """
  Get HTML formatted response from GooglePlay.

  ## Example

  error case
  ### Not found
  iex> error = [status_code: "404", message: "Not found items."]
  iex> error[:status_code]
  "404"

  """
  @spec google_play(String.t, String.t) :: list
  def google_play(package, locale \\ "en") do
    headers = [{"Accept", "text/html; charset=UTF-8"}]
    case get_body(HTTPoison.post(GooglePlay.review_url(package, locale), "", headers)) do
      {:ok, body} ->
        body
        |> String.replace("\\u003c", "<")
        |> String.replace("\\u003e", ">")
        |> String.replace("\\u003d", "=")
        |> String.replace(~r/\\/, "")
        |> Floki.parse
        |> Enum.drop(1)
      {:error, body} ->
        body
    end
  end

  defp get_body_json(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        ~s({"status_code": "404", "message": "Not found items."})
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp get_body(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, [status_code: "404", message: "Not found items."]}
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
