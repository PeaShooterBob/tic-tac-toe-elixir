defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  describe "Board.create/0" do
    test "creates a board with 9 spaces" do
      assert Board.create(3) == [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end

    test "creates a board with 16 spaces" do
      assert Board.create(4) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    end
  end

  describe "Board.mark/3" do
    test "can mark itself" do
      board = Board.create(3)
      assert Board.mark(board, 1, "X") == [0, "X", 2, 3, 4, 5, 6, 7, 8]
    end
  end

  describe "Board.rows/1" do
    test "board of 9 spaces returns rows" do
      board = Board.create(3)
      assert Board.rows(board) == [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    end

    test "board of 16 spaces returns rows" do
      board = Board.create(4)
      assert Board.rows(board) == [ [0, 1, 2, 3],
                                    [4, 5, 6 ,7],
                                    [8, 9, 10, 11],
                                    [12, 13, 14, 15] ]
    end
  end

end
