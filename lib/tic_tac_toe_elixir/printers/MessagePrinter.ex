defmodule TicTacToeElixir.Printers.MessagePrinter do
  @space_divider " | "
  @newline "\n"

  def board(rows, output_stream) do
    rows
    |> format_board
    |> output_stream.puts
  end

  defp format_board(rows) do
    Enum.reduce(rows, "", fn(row, acc) ->
      acc <> format_row(row) <> @newline
    end)
  end

  defp format_row(row) do
    row
    |> integers_to_strings
    |> Enum.reduce("", fn(space, acc) -> acc <> @space_divider <> space end)
  end

  defp integers_to_strings(row) do
    Enum.map(row, fn(space) -> integer_to_string(space) end)
  end

  defp integer_to_string(space) do
    cond do
      is_integer(space) ->
        Integer.to_string(space)
      true ->
        space
    end
  end
end

