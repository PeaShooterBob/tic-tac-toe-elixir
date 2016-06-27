defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates a board with 9 spaces" do
    assert Board.create(3) == [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  test "creates a board with 16 spaces" do
    assert Board.create(4) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  end
end
