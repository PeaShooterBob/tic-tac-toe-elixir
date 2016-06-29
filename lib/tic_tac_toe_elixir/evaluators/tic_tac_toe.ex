defmodule TicTacToeElixir.Evaluators.TicTacToe do
  alias TicTacToeElixir.Games.Marker

  @behaviour TicTacToeElixir.Evaluators.Evaluator

  def any_sets_the_same?(sets) do
    Enum.any?(sets, fn (set) -> all_spaces_the_same?(set) end)
  end

  def board_full?(board) do
    Enum.all?(board, fn (space) -> space_filled?(space) end)
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
end

