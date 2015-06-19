defmodule Reporter.AppStoreTest do
  use ExUnit.Case, async: true
  doctest Reporter.AppStore

  alias Reporter.AppStore

  setup_all do
    json = File.read!("./test/data/ios_review.json")
    {:ok, json: json}
  end

  test "AppStore.parse_to_map", %{json: json} do
    assert AppStore.parse_to_map(json) != nil
  end

  test "AppStore.author", %{json: json} do
    author = AppStore.author(json)
    assert author == %{
      "name" => %{"label" => "iTunes Store"},
      "uri" => %{"label" => "http://www.apple.com/jp/itunes/"}
      }
  end

  test "AppStore.entry", %{json: json} do
    entry = AppStore.entry(json)
    assert Enum.count(entry) == 11
  end

  test "AppStore.reviews", %{json: json} do
    reviews = AppStore.reviews(json)
    assert Enum.count(reviews) == 50
  end

  test "AppStore.icon", %{json: json} do
    assert AppStore.icon(json) != nil
  end

  test "AppStore.id", %{json: json} do
    assert AppStore.id(json) != nil
  end

  test "AppStore.link", %{json: json} do
    assert AppStore.link(json) != nil
  end

  test "AppStore.rights", %{json: json} do
    assert AppStore.rights(json) != nil
  end

  test "AppStore.title", %{json: json} do
    assert AppStore.title(json) != nil
  end

  test "AppStore.updated", %{json: json} do
    assert AppStore.updated(json) != nil
  end

end
