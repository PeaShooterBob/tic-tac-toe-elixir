defmodule TicTacToeElixir.Evaluators.Evaluator do
  @callback any_sets_the_same?(List.board) :: Boolean
  @callback board_full?(List.board) :: Boolean
  @callback space_filled?(Any.space) :: Boolean
end

