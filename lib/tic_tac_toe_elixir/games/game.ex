defmodule TicTacToeElixir.Games.Game do
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.Players.Human, as: Human
  alias TicTacToeElixir.Players.Computer, as: Computer
  alias TicTacToeElixir.Games.GameMode, as: GameMode

  def loop(marker, board, settings, players, rules, board_module, board_evaluator, message_factory, user_interface) do
    prepare_and_print_board(board, board_evaluator, message_factory, user_interface)
    if !rules.over?(board, board_evaluator) do
      current_player = hd(players)
      move = current_player.move(marker, board, settings)
      updated_board = board_module.mark(board, move, marker)
      loop(marker, updated_board, settings, players, rules, board_module, board_evaluator, message_factory, user_interface)
    end
    message_factory.game_won(opposite_marker(marker))
  end

  def turn(marker, board, evaluator, message_factory, user_interface, validator) do
    prepare_and_print_board(board, evaluator, message_factory, user_interface)
    prompt_and_return_move(marker, board, message_factory, user_interface, validator)
  end

  def setup(message_factory, user_interface, validator) do
    game_mode = get_game_mode(message_factory, user_interface, validator)
    players = select_players(game_mode)
    if game_mode == GameMode.human_vs_computer do
      marker = select_marker(message_factory, user_interface, validator)
      players = turn_order(marker, players)
    end
    players
  end

  defp prompt_and_validate(message, user_interface, valid?) do
    user_interface.print(message)
    input = user_interface.get_user_input
    case valid?.(input) do
      true -> input
      false -> prompt_and_validate(message, user_interface, valid?)
    end
  end

  defp prepare_and_print_board(board, evaluator, message_factory, user_interface) do
    rows = evaluator.rows(board)
    board_message = message_factory.board(rows)
    user_interface.print(board_message)
  end

  defp prompt_and_return_move(marker, board, message_factory, user_interface, validator) do
    turn_message = message_factory.turn(marker)
    move = prompt_and_validate(turn_message, user_interface, validate_move(board, validator))
    String.to_integer(move)
  end

  defp validate_move(board, validator) do
    fn(input) -> validator.move?(input, board) end
  end

  defp get_game_mode(message_factory, user_interface, validator) do
    game_mode_message = message_factory.game_mode
    valid_game_mode? = fn(input) -> validator.game_mode?(input) end
    prompt_and_validate(game_mode_message, user_interface, valid_game_mode?)
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
    prompt_and_validate(marker_message, user_interface, valid_marker?)
  end

  defp turn_order(marker, players) do
    cond do
      marker == Marker.x_marker -> players
      marker == Marker.o_marker -> Enum.reverse(players)
    end
  end

  defp opposite_marker(marker) do
    cond do
      marker == Marker.x_marker -> Marker.o_marker
      marker == Marker.o_marker -> Marker.x_marker
    end
  end
end

