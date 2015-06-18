defmodule ReporterTest do
  use ExUnit.Case, async: true
  doctest Reporter.AppStore
  doctest Reporter.GooglePlay
end
