defmodule ComputerTest do
  use ExUnit.Case
  alias TicTacToeElixir.Players.Computer, as: Computer
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator
  import Mock

  describe "Computer.move/0" do
    test "returns a move based off of strategy" do
      with_mock Rules, [] do
        with_mock BoardEvaluator, [] do
          board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
          assert Computer.move(Marker.x_marker, board, Rules, BoardEvaluator, MockCornerStrategy, MockMessageFactory, MockUserInterface, MockValidator) == 1
        end
      end
    end
  end
end


defmodule MockCornerStrategy do
  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(_marker, _board, _rules, _board_evaluator) do
    1
  end
end

defmodule MockCenterStrategy do
  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(_marker, _board, _rules, _board_evaluator) do
    4
  end
end

defmodule MockMessageFactory do
end

defmodule MockUserInterface do
end

defmodule MockValidator do
end
