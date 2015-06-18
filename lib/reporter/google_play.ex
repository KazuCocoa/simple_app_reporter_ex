defmodule Reporter.GooglePlay do
  alias Reporter.GooglePlay

  defstruct droid_uri: Application.get_env(:reporter, :droid_uri),
            droid_package: Application.get_env(:reporter, :droid_package)


  @doc ~S"""
  Return POST message.

  ## Examples

    iex> Reporter.GooglePlay.review_post("com.android.chrome")
    "id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=en"

    iex> Reporter.GooglePlay.review_post("com.android.chrome", "jp")
    "id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=jp"
  """
  @spec review_post(String.t, String.t) :: String.t
  def review_post(droid_package, locale \\ "en") do
    post_message(droid_package, "0", locale)
  end

  @doc ~S"""
  Return POST message with paging.

  ## Examples

    iex> Reporter.GooglePlay.review_post_page("com.android.chrome", "1")
    "id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=1&hl=en"

    iex> Reporter.GooglePlay.review_post_page("com.android.chrome", "10" , "jp")
    "id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=10&hl=jp"
  """
  @spec review_post_page(String.t, String.t, String.t) :: String.t
  def review_post_page(droid_package, page_num, locale \\ "en") do
    post_message(droid_package, page_num, locale)
  end


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
