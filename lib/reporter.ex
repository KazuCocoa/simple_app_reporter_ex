defmodule Reporter do

  # defmacro __using__(_) do
  #
  # end

  alias Reporter.AppStore
  alias Reporter.GooglePlay

  @doc """
  Get JSON response decoded by Poison.decode! from Apple Server.

  error case
  ### Not found
  iex> error = %{"message" => "Not found items.", "status_code" => "404"}
  iex> error["status_code"]
  "404"

  """
  @spec app_store_rss_json!(String.t, String.t) :: String.t
  def app_store_rss_json!(app_id, locale \\ "en") do
    headers = [{"Accept", "application/json; charset=UTF-8"}]
    HTTPoison.get(AppStore.rss_json(app_id, locale), headers)
    |> get_body_json
  end

  @spec app_store_rss_json(String.t, String.t) :: String.t
  def app_store_rss_json(app_id, locale \\ "en") do
    try do
      result = app_store_rss_json!(app_id, locale)
      {:ok, result}
    rescue
      e -> {:error, e.message}
    end
  end

  defp get_body_json({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: body |> Poison.decode!

  defp get_body_json({:ok, %HTTPoison.Response{status_code: 404}}), do: error_404

  defp get_body_json({:error, %HTTPoison.Error{reason: reason}}), do: IO.inspect |> Poison.decode! reason

  @doc """
  Get XML formatted response from Apple Server.
  """
  @spec app_store_rss_xml!(String.t, String.t) :: String.t
  def app_store_rss_xml!(app_id, locale \\ "en") do
    headers = [{"Accept", "application/xml; charset=UTF-8"}]
    HTTPoison.get(AppStore.rss_xml(app_id, locale), headers)
    |> get_body_xml
  end

  @spec app_store_rss_xml(String.t, String.t) :: String.t
  def app_store_rss_xml(app_id, locale \\ "en") do
    try do
      result = app_store_rss_xml!(app_id, locale)
      {:ok, result}
    rescue
      e -> {:error, e.message}
    end
  end

  defp get_body_xml({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: body

  defp get_body_xml({:ok, %HTTPoison.Response{status_code: 404}}), do: error_404

  defp get_body_xml({:error, %HTTPoison.Error{reason: reason}}), do: IO.inspect reason

  @doc """
  Get HTML formatted response from GooglePlay.

  ## Example

  error case
  ### Not found
  iex> error = %{"message" => "Not found items.", "status_code" => "404"}
  iex> error["status_code"]
  "404"

  """
  @spec google_play!(String.t, String.t) :: list
  def google_play!(package, locale \\ "en") do
    headers = [{"Accept", "text/html; charset=UTF-8"}]
    HTTPoison.post(GooglePlay.review_url(package, locale), "", headers)
    |> get_body
  end

  @spec google_play(String.t, String.t) :: list
  def google_play(package, locale \\ "en") do
    try do
      result = google_play!(package, locale)
      {:ok, result}
    rescue
      e -> {:error, e.message}
    end
  end


  defp get_body({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body
    |> String.replace("\\u003c", "<")
    |> String.replace("\\u003e", ">")
    |> String.replace("\\u003d", "=")
    |> String.replace(~r/\\/, "")
    |> Floki.parse
    |> Enum.drop(1)
  end

  defp get_body({:ok, %HTTPoison.Response{status_code: 404}}), do: error_404

  defp get_body({:error, %HTTPoison.Error{reason: reason}}), do: IO.inspect reason

  defp error_404 do
    Map.new
    |> Map.put("status_code", "404")
    |> Map.put("message", "Not found items.")
  end
end
