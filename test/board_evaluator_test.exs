defmodule BoardEvaluatorTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "BoardEvaluator.any_sets_the_same?/1" do
    test "returns true any sets are the same" do
      board = [ Marker.x_marker, Marker.x_marker, Marker.x_marker,
                "3", "4", "5",
                "6", "7", "8" ]
      assert BoardEvaluator.any_sets_the_same?(board) == true
    end

    test "returns true if any sets are the same for 4x4 board" do
      board = [ Marker.x_marker, Marker.x_marker, Marker.x_marker, Marker.x_marker,
               4, 5, 6, 7,
               8, 9, 10, 11]
      assert BoardEvaluator.any_sets_the_same?(board) == true
    end

    test "returns false if any sets are not the same" do
      board = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
      assert BoardEvaluator.any_sets_the_same?(board) == false
    end

    test "returns false if any sets are not the same, 4x4 board" do
      board = [ Marker.x_marker, Marker.x_marker, "2", "3",
               4, 5, 6, 7,
               8, 9, 10, 11 ]
      assert BoardEvaluator.any_sets_the_same?(board) == false
    end
  end

  describe "BoardEvaluator.board_full?/1" do
    test "return true if board is full" do
      board = [Marker.x_marker, Marker.x_marker, Marker.x_marker,
               Marker.x_marker, Marker.x_marker, Marker.x_marker,
               Marker.x_marker, Marker.x_marker, Marker.x_marker]
      assert BoardEvaluator.board_full?(board) == true
    end

    test "returns true if board is full of mixed markers" do
      board = [Marker.x_marker, Marker.o_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker]
      assert BoardEvaluator.board_full?(board) == true
    end

    test "returns false if board is not full" do
      board = [Marker.x_marker, 2, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker]
      assert BoardEvaluator.board_full?(board) == false
    end
  end

  describe "BoardEvaluator.empty_spaces/1" do
    test "returns no empty spaces if board is full" do
      board = [Marker.x_marker, Marker.o_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker]
      assert BoardEvaluator.empty_spaces(board) == []
    end

    test "returns all the empty spaces" do
      board = [0, 1, 2, 3, 4, 5, 6, Marker.x_marker, 8]
      assert BoardEvaluator.empty_spaces(board) == [0, 1, 2, 3, 4, 5, 6, 8]
    end
  end

  describe "BoardEvaluator.depth/1" do
    test "returns zero if board is full" do
      board = [Marker.x_marker, Marker.o_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker,
               Marker.o_marker, Marker.x_marker, Marker.x_marker]
      assert BoardEvaluator.depth(board) == 0
    end

    test "returns three if three empty spaces" do
      board = [0, 1, 2,
               Marker.x_marker, Marker.x_marker, Marker.x_marker,
               Marker.o_marker, Marker.o_marker, Marker.o_marker]
      assert BoardEvaluator.depth(board) == 3
    end
  end
end
