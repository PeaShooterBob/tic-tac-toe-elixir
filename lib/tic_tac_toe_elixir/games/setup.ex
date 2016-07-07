defmodule TicTacToeElixir.Games.Setup do
  alias TicTacToeElixir.Players.Human, as: Human
  alias TicTacToeElixir.Players.Computer, as: Computer
  alias TicTacToeElixir.Games.GameMode, as: GameMode
  alias TicTacToeElixir.Games.Marker, as: Marker

  def setup(message_factory, user_interface, validator) do
    game_mode = get_game_mode(message_factory, user_interface, validator)
    players = select_players(game_mode)
    if game_mode == GameMode.human_vs_computer do
      marker = select_marker(message_factory, user_interface, validator)
      players = turn_order(marker, players)
    end
    players
  end

  defp get_game_mode(message_factory, user_interface, validator) do
    game_mode_message = message_factory.game_mode
    user_interface.prompt_and_validate(game_mode_message, &validator.game_mode?/1)
  end

  defp select_players(game_mode) do
    cond do
      game_mode == GameMode.human_vs_computer -> [Human, Computer]
      game_mode == GameMode.human_vs_human -> [Human, Human]
    end
  end

  defp select_marker(message_factory, user_interface, validator) do
    marker_message = message_factory.marker
    valid_marker? = fn(input) -> validator.marker?(input) end
    user_interface.prompt_and_validate(marker_message , valid_marker?)
  end

  defp turn_order(marker, players) do
    cond do
      marker == Marker.x_marker -> players
      marker == Marker.o_marker -> Enum.reverse(players)
    end
  end
end
