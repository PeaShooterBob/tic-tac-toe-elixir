defmodule TicTacToeElixir.Games.Game do
  alias TicTacToeElixir.Games.Setup, as: Setup
  alias TicTacToeElixir.Games.Marker, as: Marker

  def start(rules, board_module, board_evaluator, message_factory, user_interface, validator, strategy) do
    players = Setup.setup(message_factory, user_interface, validator)
    board = board_module.create(3, 3)
    loop(Marker.x_marker, board, players, rules, board_module, board_evaluator, message_factory, user_interface, validator, strategy)
  end

  def loop(marker, board, players, rules, board_module, board_evaluator, message_factory, user_interface, validator, strategy) do
    prepare_and_print_board(board, board_evaluator, message_factory, user_interface)
    if !rules.over?(board, board_evaluator) do
      current_player = hd(players)
      move = current_player.move(marker, board, rules, board_evaluator, strategy, message_factory, user_interface, validator)
      updated_board = board_module.mark(board, move, marker)
      marker = opposite_marker(marker)
      players = Enum.reverse(players)
      loop(marker, updated_board, players, rules, board_module, board_evaluator, message_factory, user_interface, validator, strategy)
    end
  end

  defp prepare_and_print_board(board, board_evaluator, message_factory, user_interface) do
    rows = board_evaluator.rows(board)
    board_message = message_factory.board(rows)
    user_interface.print(board_message)
  end

  defp opposite_marker(marker) do
    cond do
      marker == Marker.x_marker -> Marker.o_marker
      marker == Marker.o_marker -> Marker.x_marker
    end
  end
end

