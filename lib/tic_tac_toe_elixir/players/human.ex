defmodule TicTacToeElixir.Players.Human do
  alias TicTacToeElixir.Settings.Game, as: Settings
  @behaviour TicTacToeElixir.Players.Player

  def move(_marker, _board, settings) do
    user_interface = Settings.get(settings, :UI)
    user_interface.get_player_move
  end
end
