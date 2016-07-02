defmodule MinimaxTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Strategies.Minimax, as: Minimax
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Evaluators.TicTacToe, as: Evaluator
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules

  describe "Minimax.best_move/3" do
    test "blocks winning move" do
      board = ["X", "X", 2, 3, 4, 5, 6, 7, 8]
      best_move = Minimax.best_move("O", board, Rules, Evaluator)
      assert best_move == 2
    end

    test "blocks a two way fork for opponent" do
      board = [0, "X", 2,
              "X", "O", 5,
               6, 7, 8]
     best_move = Minimax.best_move("O", board, Rules, Evaluator)
     assert best_move == 0
    end

    test "does not create a two way unblocked fork for opponent" do
      board = [ 0, 1, "X",
                3, "O", 5,
               "X", 7, 8]
      best_move = Minimax.best_move("O", board, Rules, Evaluator)
      assert Enum.member?([1, 3, 5, 7], best_move)
    end
  end

end

