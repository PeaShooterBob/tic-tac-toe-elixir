defmodule ComputerTest do
  use ExUnit.Case
  alias TicTacToeElixir.Players.Computer, as: Computer
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Settings.Game, as: Settings

  setup do
    {:ok, settings} =  Settings.start_link
    {:ok, settings: settings}
  end

  describe "Computer.move/0" do
    test "moves based off of strategy", %{settings: settings} do
      Settings.put(settings, :strategy, MockCornerStrategy)
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      move = Computer.move(Marker.o_marker, board, settings)
      assert move == 1
    end

    test "can use a different strategy", %{settings: settings} do
      Settings.put(settings, :strategy, MockCenterStrategy)
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      move = Computer.move(Marker.o_marker, board, settings)
      assert move == 4
    end
  end
end


defmodule MockCornerStrategy do
  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(_marker, _board, _rules, _evaluator) do
    1
  end
end

defmodule MockCenterStrategy do
  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(_marker, _board, _rules, _evaluator) do
    4
  end
end
