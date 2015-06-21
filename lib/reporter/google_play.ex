defmodule Reporter.GooglePlay do
  alias Reporter.GooglePlay

  defstruct droid_uri: Application.get_env(:reporter, :droid_uri)

  @doc ~S"""
  Return POST message.

  ## Examples

    iex> Reporter.GooglePlay.review_url("com.android.chrome")
    "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=en"

    iex> Reporter.GooglePlay.review_url("com.android.chrome", "jp")
    "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=jp"

  """
  @spec review_url(String.t, String.t) :: String.t
  def review_url(droid_package, locale \\ "en") do
    %GooglePlay{}.droid_uri <> "?" <> params(droid_package, locale)
  end

  defp params(droid_package, locale \\ "en"), do: post_message(droid_package, "0", locale)

  @doc ~S"""
  Return POST message with paging.

  ## Examples

    iex> Reporter.GooglePlay.review_url_with_page("com.android.chrome", "1")
    "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=1&hl=en"

    iex> Reporter.GooglePlay.review_url_with_page("com.android.chrome", "10" , "jp")
    "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=10&hl=jp"

  """
  @spec review_url_with_page(String.t, String.t, String.t) :: String.t
  def review_url_with_page(droid_package, page_num ,locale \\ "en") do
    %GooglePlay{}.droid_uri <> "?" <> params_with_page(droid_package, page_num, locale)
  end

  def params_with_page(droid_package, page_num, locale \\ "en"), do: post_message(droid_package, page_num, locale)

  defp post_message(droid_package, page_num, locale) do
    Enum.join([
      "id=",
      droid_package,
      "&reviewSortOrder=0&reviewType=1&pageNum=",
      page_num,
      "&hl=",
      locale
      ]
    )
  end
end
