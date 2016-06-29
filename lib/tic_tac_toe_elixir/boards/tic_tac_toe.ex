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

  def rows(board) do
    Enum.chunk(board, row_length(board))
  end

  def columns(board) do
    board
    |> rows
    |> List.zip
    |> tuples_to_lists
  end

  def diagonals(board) do
    [first_diagonal(board), second_diagonal(board)]
  end

  defp row_length(board) do
    board
    |> length
    |> :math.sqrt
    |> round
  end

  defp tuples_to_lists(list_of_tuples) do
    Enum.map(list_of_tuples, fn (row) -> Tuple.to_list(row) end)
  end

  defp create_range(length) do
    0..(length - 1)
  end

  defp first_diagonal(board) do
    board
    |> row_length
    |> first_diagonal_indexes
    |> find_diagonal(board)
  end

  defp second_diagonal(board) do
    board
    |> row_length
    |> second_diagonal_indexes
    |> find_diagonal(board)
  end

  defp first_diagonal_indexes(row_length) do
    spaces_between_diagonal = row_length + 1
    for i <- 0..(row_length - 1) do
      i * spaces_between_diagonal
    end
  end

  defp second_diagonal_indexes(row_length) do
    spaces_between_diagonal = row_length - 1
    for i <- 1..row_length do
      i * spaces_between_diagonal
    end
  end

  defp find_diagonal(diagonal_indexes, board) do
     board
     |> Enum.with_index
     |> Enum.filter(fn (space) -> is_part_of_diagonal?(space, diagonal_indexes) end)
     |> Enum.map(fn (index_space) -> elem(index_space, 0) end)
  end

  defp is_part_of_diagonal?(index_space, diagonal_indexes) do
    index = elem(index_space, 1)
    Enum.member?(diagonal_indexes, index)
  end

end
