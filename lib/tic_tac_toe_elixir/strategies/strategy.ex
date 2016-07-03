defmodule TicTacToeElixir.Strategies.Strategy do
  @callback best_move(String.marker, List.rows, Module.rules, Module.board_evaluator) :: Integer
end
