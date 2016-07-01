defmodule BoardEvaluatorTest do
  use ExUnit.Case
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
end
