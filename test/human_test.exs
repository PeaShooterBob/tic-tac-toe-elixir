defmodule HumanTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Players.Human, as: Human
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Settings.Game, as: Settings
  alias TicTacToeElixir.MessageFactories.TicTacToe, as: MessageFactory
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator
  import Mock

  describe "Human.move/8" do
    test "returns a move if valid" do
      with_mock MessageFactory,
      [turn: fn(_marker) -> "Where to move?" end] do
        with_mock UserInterface,
        [prompt_and_validate: fn(_message, _validator_callback) -> "3" end] do
          with_mock Validator,
          [move?: fn(_move, _board) -> true end] do
            board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
            move = Human.move(Marker.x_marker, board, MockRules, MockBoardEvaluator, MockStrategy, MessageFactory, UserInterface, Validator)
            assert called MessageFactory.turn(Marker.x_marker)
            assert move == 3
          end
        end
      end
    end
  end
end

defmodule MockRules do
end

defmodule MockBoardEvaluator do
end

defmodule MockStrategy do
end

