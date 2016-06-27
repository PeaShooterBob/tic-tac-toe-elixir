defmodule Board do
  def create(dimmension) do
    end_index = size_of_board(dimmension) - 1
    Enum.to_list(0..end_index)
  end

  def mark(board, space, marker) do
    List.replace_at(board, space, marker)
  end

  def rows(board) do
    Enum.chunk(board, row_length(board))
  end

  defp size_of_board(dimmension) do
    dimmension * dimmension
  end

  defp row_length(board) do
    round(length(board)|>:math.sqrt)
  end
end
