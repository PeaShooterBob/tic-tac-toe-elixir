defmodule TicTacToeElixir.Validators.TicTacToe do
  alias TicTacToeElixir.Games.Marker, as: Marker

  def move?(move, board) do
    !marker?(move) && move_on_board?(move, board)
  end

  def marker?(move) do
    move == Marker.x_marker || move == Marker.o_marker
  end

  def game_mode?(game_mode) do
    game_mode == "HH" || game_mode == "HC"
  end

  defp move_on_board?(move, board) do
    Enum.any?(board, &(&1 == move))
  end
end

