defmodule RomanumTest do
  use ExUnit.Case
  doctest Romanum

  test "greets the world" do
    assert Romanum.hello() == :world
  end
end
