defmodule TicTacToeElixir.Validators.TicTacToe do
  alias TicTacToeElixir.Games.Marker, as: Marker

  def move?(move, board) do
    move = to_integer(move)
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

  defp to_integer(move) do
    if Regex.match?(~r/[0-9]/, move) do
      move = String.to_integer(move)
    end
    move
  end
end

