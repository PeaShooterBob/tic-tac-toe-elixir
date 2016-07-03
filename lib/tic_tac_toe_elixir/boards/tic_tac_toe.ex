defmodule TicTacToeElixir.Boards.TicTacToe do
  @behaviour TicTacToeElixir.Boards.Board

  def create(width, height) do
    width * height
    |> create_range
    |> Enum.to_list
  end

  def mark(board, space, marker) do
    List.replace_at(board, space, marker)
  end

  defp create_range(length) do
    0..(length - 1)
  end


end
