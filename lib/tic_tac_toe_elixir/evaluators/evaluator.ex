defmodule TicTacToeElixir.Evaluators.Evaluator do
  @callback any_sets_the_same?(List.sets) :: Boolean
  @callback board_full?(List.board) :: Boolean
end

