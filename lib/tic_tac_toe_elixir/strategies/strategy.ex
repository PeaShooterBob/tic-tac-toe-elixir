defmodule TicTacToeElixir.Strategies.Strategy do
  @callback best_move(List.rows) :: String
end
