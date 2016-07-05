defmodule TicTacToeElixir.UserInterfaces.Generic do
  @behaviour TicTacToeElixir.UserInterfaces.UserInterface
  def print(message) do
    IO.puts(message)
  end

  def get_user_input do
    IO.gets ""
  end
end
