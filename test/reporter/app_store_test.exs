defmodule Reporter.AppStoreTest do
  use ExUnit.Case, async: true
  doctest Reporter.AppStore

  alias Reporter.AppStore

  setup_all do
    json = File.read!("./test/data/ios_review.json") |> Poison.decode!
    json_empty = File.read!("./test/data/ios_review_empty.json") |> Poison.decode!
    {:ok, json: json, empty: json_empty}
  end

  test "AppStore.all_json", %{json: json, empty: json_empty} do
    assert AppStore.all_json(json) != nil
    assert AppStore.all_json(json_empty) != nil
  end

  test "AppStore.author", %{json: json, empty: json_empty} do
    author = AppStore.author(json) != nil
    author = AppStore.author(json_empty) != nil
  end

  test "AppStore.entry", %{json: json, empty: json_empty} do
    entry = AppStore.entry(json)
    assert Enum.count(entry) == 11
    assert AppStore.entry(json_empty) == %{}
  end

  test "AppStore.reviews", %{json: json, empty: json_empty} do
    reviews = AppStore.reviews(json)
    assert Enum.count(reviews) == 50
    assert AppStore.reviews(json_empty) == %{}
  end

  test "AppStore.icon", %{json: json, empty: json_empty} do
    assert AppStore.icon(json) != nil
    assert AppStore.icon(json_empty) != nil
  end

  test "AppStore.id", %{json: json, empty: json_empty} do
    assert AppStore.id(json) != nil
    assert AppStore.id(json_empty) != nil
  end

  test "AppStore.link", %{json: json, empty: json_empty} do
    assert AppStore.link(json) != nil
    assert AppStore.link(json_empty) != nil
  end

  test "AppStore.rights", %{json: json, empty: json_empty} do
    assert AppStore.rights(json) != nil
    assert AppStore.rights(json_empty) != nil
  end

  test "AppStore.title", %{json: json, empty: json_empty} do
    assert AppStore.title(json) != nil
    assert AppStore.title(json_empty) != nil
  end

  test "AppStore.updated", %{json: json, empty: json_empty} do
    assert AppStore.updated(json) != nil
    assert AppStore.updated(json_empty) != nil
  end

end
