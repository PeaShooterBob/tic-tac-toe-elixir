defmodule TicTacToeElixir.MessageFactories.MessageFactory do
  @callback board(List.rows) :: String
  @callback game_mode :: String
  @callback marker :: String
  @callback turn(String.marker) :: String
end
