defmodule TicTacToeElixir.Printers.MessagePrinter do
  @callback board(List.rows) :: String
  @callback game_mode :: String
  @callback marker :: String
  @callback turn(String.marker) :: String
  @callback print(Module.printer, String.message) :: any
end
