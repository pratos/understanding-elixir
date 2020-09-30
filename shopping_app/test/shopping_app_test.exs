defmodule ShoppingAppTest do
  use ExUnit.Case
  doctest ShoppingApp

  test "greets the world" do
    assert ShoppingApp.hello() == :world
  end
end
