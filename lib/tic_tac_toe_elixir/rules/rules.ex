defmodule TicTacToeElixir.Rules.Rules do
  @callback won?(List.board, Module.board_evaluator) :: Boolean
  @callback tied?(List.board, Module.board_evaluator) :: Boolean
  @callback over?(List.board, MOdule.board_evaluator) :: Boolean
end
