defmodule TicTacToeElixir.Players.Player do
  @callback move(String.marker, List.board, Agent.settings) :: Integer
end