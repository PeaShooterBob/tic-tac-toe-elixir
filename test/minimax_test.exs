defmodule MinimaxTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Strategies.Minimax, as: Minimax
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Evaluators.TicTacToe, as: Evaluator
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules

  describe "Minimax.best_move/3" do

    # test "returns winning move" do
    #   board = [ "X", "X", 2, "3", "4", "5", "6", "7", "8" ]
    #   assert Minimax.best_move(Marker.x_marker, board) == 2
    # end

    # test "returns a winning move" do
    #   board = [0, 1, 2, 3, 4, 5, "X", "X", 8]
    #   assert Minimax.best_move(Marker.x_marker, board) == 8
    # end
  end

  describe "Minimax.minimax/?" do
    test "returns postive score for winning board and maximizing player" do
      board = [ Marker.x_marker, Marker.x_marker, Marker.x_marker,
                3, 4, 5,
                6, 7, 8 ]
      score = Minimax.minimax(Marker.x_marker, board, true, Rules, Evaluator)
      assert score == 10
    end

    test "returns 0 score for tied board" do
      board = [ Marker.x_marker, Marker.o_marker, Marker.x_marker,
                Marker.x_marker, Marker.o_marker, Marker.x_marker,
                Marker.o_marker, Marker.x_marker, Marker.o_marker ]
      score = Minimax.minimax(Marker.x_marker, board, false, Rules, Evaluator)
      assert score == 0
    end

    test "returns negative score for winning board for minimizing player" do
      board = [ Marker.o_marker, Marker.o_marker, Marker.o_marker,
                3, 4, 5,
                6, 7, 8 ]
      score = Minimax.minimax(Marker.x_marker, board, false, Rules, Evaluator)
      assert score == -10
    end
  end


end
