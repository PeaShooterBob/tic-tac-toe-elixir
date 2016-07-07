defmodule TicTacToeElixir.Players.Computer do
  @behaviour TicTacToeElixir.Players.Player

  def move(marker, board, rules, board_evaluator, strategy, _message_factory, _user_interface, _validator) do
    strategy.best_move(marker, board, rules, board_evaluator)
  end
end

