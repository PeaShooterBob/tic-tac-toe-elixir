defmodule GameTest do
  use ExUnit.Case, async: false
  import Mock
  alias TicTacToeElixir.Games.Game, as: Game
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface

  describe "Game.prompt_and_validate/3" do
    test "it can validate input" do
      message = "Welcome to the game"
      with_mock UserInterface,
      [get_user_input: fn -> "some input" end,
        print: fn(input) -> input end] do
         valid_input = Game.prompt_and_validate(message, UserInterface, fn(input) -> true end)
         assert called UserInterface.print(message)
         assert called UserInterface.get_user_input
         assert valid_input = "some input"
      end
    end
  end
end
