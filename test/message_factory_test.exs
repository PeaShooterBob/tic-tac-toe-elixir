defmodule MessageFactoryTest do
  use ExUnit.Case
  alias TicTacToeElixir.MessageFactories.TicTacToe, as: MessageFactory
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "MessageFactory.board/1" do
    test "returns a formatted board" do
      rows = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
      expected_spaces = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      printed_board = MessageFactory.board(rows)

      Enum.each(expected_spaces, fn (space) ->
        assert String.contains?(printed_board, space)
      end)
    end
  end

  describe "MessageFactory.game_mode/0" do
    test "returns game mode instructions"  do
      game_mode_prompt = MessageFactory.game_mode()
      assert String.contains?(game_mode_prompt, "game mode")
    end
  end

  describe "MessageFactory.marker/0" do
    test "returns a marker prompt" do
      marker_prompt = MessageFactory.marker()
      assert String.contains?(marker_prompt, "marker")
    end
  end

  describe "MessageFactory.turn/1" do
    test "returns a turn prompt" do
      turn_prompt = MessageFactory.turn(Marker.x_marker)
      assert String.contains?(turn_prompt, Marker.x_marker)
      assert String.contains?(turn_prompt, "turn")
    end
  end
end

