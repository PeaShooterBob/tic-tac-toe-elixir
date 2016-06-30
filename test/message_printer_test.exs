defmodule MessagePrinterTest do
  use ExUnit.Case
  alias TicTacToeElixir.Printers.MessagePrinter, as: MessagePrinter

  describe "MessagePrinter.board/1" do
    test "it prints the board" do
      rows = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
      expected_spaces = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

      printed_board = MessagePrinter.board(rows, MockOutputStream)
      Enum.each(expected_spaces, fn (space) ->
        String.contains?(printed_board, space)
      end)
    end
  end
end

defmodule MockOutputStream do
  def puts(string) do
    string
  end
end
