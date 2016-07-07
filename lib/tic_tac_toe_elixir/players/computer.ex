defmodule TicTacToeElixir.Players.Computer do
  alias TicTacToeElixir.Settings.Game, as: Settings
  @behaviour TicTacToeElixir.Players.Player

  def move(marker, board, rules, board_evaluator, strategy, message_factory, user_interface, validator) do
    strategy.best_move(marker, board, rules, board_evaluator)
  end
end

