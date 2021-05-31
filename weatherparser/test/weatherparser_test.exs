defmodule WeatherparserTest do
  use ExUnit.Case
  doctest Weatherparser

  test "greets the world" do
    assert Weatherparser.hello() == :world
  end
end
