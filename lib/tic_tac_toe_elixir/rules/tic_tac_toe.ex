defmodule TicTacToeElixir.Rules.TicTacToe do
  @behaviour TicTacToeElixir.Rules.Rules

  def over?(board, board_evaluator) do
    won?(board, board_evaluator) || tied?(board, board_evaluator)
  end

  def won?(board, board_evaluator) do
    board_evaluator.any_sets_the_same?(board)
  end

  def tied?(board, board_evaluator) do
    !won?(board, board_evaluator) && board_evaluator.board_full?(board)
  end
end
