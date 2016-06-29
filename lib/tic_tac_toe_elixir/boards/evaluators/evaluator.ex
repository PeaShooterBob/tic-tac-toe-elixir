defmodule TicTacToeElixir.Boards.Evaluators.Evaluator do
  @callback any_sets_the_same?(List.board) :: Boolean
  @callback board_full?(List.board) :: Boolean
end

