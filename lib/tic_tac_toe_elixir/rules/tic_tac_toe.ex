defmodule TicTacToeElixir.Rules.TicTacToe do
  def won?(board, board_evaluator) do
    board_evaluator.any_sets_the_same?(board)
  end

  def tied?(board, board_evaluator) do
    !won?(board, board_evaluator) && board_evaluator.board_full?(board)
  end
end
