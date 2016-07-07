defmodule TicTacToeElixir.MessageFactories.TicTacToe do
  @behaviour TicTacToeElixir.MessageFactories.MessageFactory

  @space_divider " | "
  @newline "\n"

  def board(rows) do
    format_board(rows)
  end

  def game_mode do
    "Welcome to tic tac toe. Please choose a game mode. Enter 'HH' for Human
    vs Human or 'HC' for human vs computer"
  end

  def marker do
    "Please select a marker.  Enter 'X' to go first, and 'O' to go second"
  end

  def turn(marker) do
    ~s(It is your turn #{marker})
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

