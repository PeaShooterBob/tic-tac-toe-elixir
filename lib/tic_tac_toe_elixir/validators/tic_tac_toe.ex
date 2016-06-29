defmodule TicTacToeElixir.Validators.TicTacToe do
  alias TicTacToeElixir.Games.Marker, as: Marker

  def valid_move?(move, board) do
    !marker?(move) && move_on_board?(move, board)
  end

  defp marker?(move) do
    move == Marker.x_marker || move == Marker.o_marker
  end

  defp move_on_board?(move, board) do
    Enum.any?(board, &(&1 == move))
  end
end

