defmodule BoardEvaluatorTest do
  use ExUnit.Case
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator

  describe "BoardEvalutor.any_sets_the_same?/1" do
    test "returns true if any sets the same" do
      sets = [ ["X", "X", "X"] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == true
    end

    test "returns true if any set are the same" do
      sets = [ ["X", "X", "X", "X"], [4, 5, 6, 7] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == true
    end

    test "returns false if any set are not the same" do
      sets = [ [ 0, 1, 2] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == false
    end

    test "returns false if any sets are not the same" do
      sets = [ ["X", "X", "2", "3"], [4, 5, 6, 7] ]
      assert BoardEvaluator.any_sets_the_same?(sets) == false
    end
  end
end
