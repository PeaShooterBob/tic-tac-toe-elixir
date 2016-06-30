defmodule MessagePrinterTest do
  use ExUnit.Case
  alias TicTacToeElixir.Printers.TicTacToe, as: MessagePrinter
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "MessagePrinter.board/1" do
    test "returns a formatted board" do
      rows = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
      expected_spaces = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

      printed_board = MessagePrinter.board(rows)
      Enum.each(expected_spaces, fn (space) ->
        assert String.contains?(printed_board, space)
      end)
    end
  end

  describe "MessagePrinter.game_mode/0" do
    test "returns game mode instructions"  do
      game_mode_prompt = MessagePrinter.game_mode()
      assert String.contains?(game_mode_prompt, "game mode")
    end
  end

  describe "MessagePrinter.marker/0" do
    test "returns a marker prompt" do
      marker_prompt = MessagePrinter.marker()
      assert String.contains?(marker_prompt, "marker")
    end
  end

  describe "MessagePrinter.turn/1" do
    test "returns a turn prompt" do
      turn_prompt = MessagePrinter.turn(Marker.x_marker)
      assert String.contains?(turn_prompt, Marker.x_marker)
      assert String.contains?(turn_prompt, "turn")
    end
  end

  describe "MessagePrinter.print/2" do
    test "prints the message" do
      printed_message = MessagePrinter.print(MockOutputStream, "Tic tac toe is cool")
      assert String.contains?(printed_message, "Tic tac toe is cool")
    end
  end
end

defmodule MockOutputStream do
  def puts(string) do
    string
  end
end
