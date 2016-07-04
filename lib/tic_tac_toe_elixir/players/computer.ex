defmodule TicTacToeElixir.Players.Computer do
  alias TicTacToeElixir.Settings.Game, as: Settings
  @behaviour TicTacToeElixir.Players.Player

  def move(marker, board, settings) do
    strategy = Settings.get(settings, :strategy)
    rules = Settings.get(settings, :rules)
    evaluator = Settings.get(settings, :evaluator)

    strategy.best_move(marker, board, rules, evaluator)
  end
end

