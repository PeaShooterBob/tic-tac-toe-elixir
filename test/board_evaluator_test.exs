defmodule BoardEvaluatorTest do
  use ExUnit.Case
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "BoardEvaluator.any_sets_the_same?/1" do
    test "returns true if any sets the same" do
      sets = [ [Marker.x_marker, Marker.x_marker, Marker.x_marker] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == true
    end

    test "returns true if any set are the same" do
      sets = [ [Marker.x_marker, Marker.x_marker, Marker.x_marker, Marker.x_marker],
               [4, 5, 6, 7] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == true
    end

    test "returns false if any set are not the same" do
      sets = [ [ 0, 1, 2] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == false
    end

    test "returns false if any sets are not the same" do
      sets = [ [Marker.x_marker, Marker.x_marker, "2", "3"],
               [4, 5, 6, 7] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == false
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
