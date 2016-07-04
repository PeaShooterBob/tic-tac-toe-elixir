defmodule HumanTest do
  use ExUnit.Case
  alias TicTacToeElixir.Players.Human, as: Human
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Settings.Game, as: Settings

  setup do
    {:ok, settings} =  Settings.start_link
    {:ok, settings: settings}
  end

  describe "Human.move/3" do
    test "can make a move by interacting with user interface", %{settings: settings} do
      Settings.put(settings, :UI, MockUI)
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      move = Human.move(Marker.x_marker, board, settings)
      assert move == 8
    end

    test "can make a move by interacting with different user interface" , %{settings: settings} do
      Settings.put(settings, :UI, MockUIWeb)
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      move = Human.move(Marker.x_marker, board, settings)
      assert move == 4
    end
  end
end

defmodule MockUI do
  def get_user_input do
    8
  end
end

defmodule MockUIWeb do
  def get_user_input do
    4
  end
end

