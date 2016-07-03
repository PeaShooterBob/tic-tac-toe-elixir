defmodule MinimaxTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Strategies.Minimax, as: Minimax
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Evaluators.TicTacToe, as: Evaluator
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules

  describe "Minimax.best_move/3" do
    test "blocks winning move" do
      board = [Marker.x_marker, Marker.x_marker, 2, 3, 4, 5, 6, 7, 8]
      best_move = Minimax.best_move(Marker.o_marker, board, Rules, Evaluator)
      assert best_move == 2
    end

    test "blocks a two way fork for opponent" do
      board = [0, Marker.x_marker, 2,
              Marker.x_marker, Marker.o_marker, 5,
               6, 7, 8]
     best_move = Minimax.best_move(Marker.o_marker, board, Rules, Evaluator)
     assert best_move == 0
    end

    test "does not create a two way unblocked fork for opponent" do
      board = [ 0, 1, Marker.x_marker,
                3, Marker.o_marker, 5,
               Marker.x_marker, 7, 8]
      best_move = Minimax.best_move(Marker.o_marker, board, Rules, Evaluator)
      assert Enum.member?([1, 3, 5, 7], best_move)
    end

    test "picks best move quickly" do
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      time_to_run = Benchmark.measure(fn -> Minimax.best_move(Marker.x_marker, board, Rules, Evaluator) end)
      assert time_to_run < 4
    end
  end

end

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

