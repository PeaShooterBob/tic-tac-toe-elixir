defmodule TicTacToeElixir.Evaluators.TicTacToe do
  alias TicTacToeElixir.Games.Marker

  @behaviour TicTacToeElixir.Evaluators.Evaluator

  def any_sets_the_same?(board) do
    board
    |> all_sets
    |> Enum.any?(fn (set) -> all_spaces_the_same?(set) end)
  end

  def board_full?(board) do
    Enum.all?(board, fn (space) -> space_filled?(space) end)
  end

  defp all_sets(board) do
    rows(board) ++ columns(board) ++ diagonals(board)
  end

  defp space_filled?(space) do
    space == Marker.x_marker || space == Marker.o_marker
  end

  defp all_spaces_the_same?(spaces) do
    length_uniq_spaces(spaces) == 1
  end

  defp length_uniq_spaces(spaces) do
    spaces
    |> Enum.uniq
    |> length
  end

  defp rows(board) do
    Enum.chunk(board, row_length(board))
  end

  defp columns(board) do
    board
    |> rows
    |> List.zip
    |> tuples_to_lists
  end

  defp diagonals(board) do
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

