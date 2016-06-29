defmodule TicTacToeElixir.Evaluators.TicTacToe do
  @behaviour TicTacToeElixir.Evaluators.Evaluator

  def any_sets_the_same?(sets) do
    Enum.any?(sets, fn (set) -> all_spaces_the_same?(set) end)
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

