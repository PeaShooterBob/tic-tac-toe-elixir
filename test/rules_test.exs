defmodule RulesTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules

  describe "Rules.won?/1" do
    test "returns true when game is won" do
      board = [true]
      board_evaluator = MockBoardEvaluator
      assert Rules.won?(board, board_evaluator) == true
    end

    test "returns false when game is not won" do
      board = [false]
      board_evaluator = MockBoardEvaluator
      assert Rules.won?(board, board_evaluator) == false
    end
  end

  describe "Rules.tied?/1" do
    test "returns true when game is tied" do
      board = [false, true]
      board_evaluator = MockBoardEvaluator
      assert Rules.tied?(board, board_evaluator) == true
    end

    test "returns false when game is not tied" do
      board = [false, false]
      board_evaluator = MockBoardEvaluator
      assert Rules.tied?(board, board_evaluator) == false
    end

    test "return false when game is won" do
      board = [true, true]
      board_evaluator = MockBoardEvaluator
      assert Rules.tied?(board, board_evaluator) == false
    end
  end
end

defmodule MockBoardEvaluator do
  @behaviour TicTacToeElixir.Evaluators.Evaluator

  def any_sets_the_same?(board) do
    hd(board)
  end

  def board_full?(board) do
    List.last(board)
  end

  def space_filled?(space) do

  end
end
