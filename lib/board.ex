defmodule Board do
  def create(dimmension) do
    dimmension
    |> size_of_board
    |> create_range
    |> Enum.to_list
  end

  def mark(board, space, marker) do
    List.replace_at(board, space, marker)
  end

  def rows(board) do
    Enum.chunk(board, row_length(board))
  end

  def columns(board) do
    board
    |> rows
    |> List.zip
    |> tuples_to_lists

  end

  defp size_of_board(dimmension) do
    dimmension * dimmension
  end

  defp row_length(board) do
    board
    |> length
    |> :math.sqrt
    |> round
  end

  defp tuples_to_lists(list_of_tuples) do
    Enum.map(list_of_tuples, fn row -> Tuple.to_list(row) end)
  end

  defp create_range(board_size) do
    0..(board_size-1)
  end
end
