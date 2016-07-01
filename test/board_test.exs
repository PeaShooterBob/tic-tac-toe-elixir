defmodule BoardTest do
  use ExUnit.Case
  alias TicTacToeElixir.Boards.TicTacToe, as: Board
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "Board.create/0" do
    test "creates a board with 9 spaces" do
      assert Board.create(3, 3) == [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end

    test "creates a board with 16 spaces" do
      assert Board.create(4, 4) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    end
  end

  describe "Board.mark/3" do
    test "can mark itself" do
      board = Board.create(3, 3)
      assert Board.mark(board, 1, Marker.x_marker) == [0, Marker.x_marker, 2, 3, 4, 5, 6, 7, 8]
    end
  end

end
