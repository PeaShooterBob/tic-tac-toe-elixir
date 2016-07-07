defmodule SetupTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Games.GameMode, as: GameMode
  alias TicTacToeElixir.Games.Setup, as: Setup
  alias TicTacToeElixir.MessageFactories.TicTacToe, as: MessageFactory
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator
  import Mock

  describe "Setup.setup/3" do
    test "returns two human players" do
      with_mock MessageFactory,
      [game_mode: fn -> "Which type of game?" end] do
        with_mock Validator,
        [game_mode?: fn(_game_mode) -> true end] do
          with_mock UserInterface,
          [prompt_and_validate: fn(_game_mode_mesage, valid_game_mode?) ->
           valid_game_mode?.("HC")
           GameMode.human_vs_human end] do
             Setup.setup(MessageFactory, UserInterface, Validator)
             assert called MessageFactory.game_mode
             assert called Validator.game_mode?("HC")
             assert called UserInterface.prompt_and_validate("Which type of game?", &Validator.game_mode?/1)
           end
        end
      end
    end
  end
end
