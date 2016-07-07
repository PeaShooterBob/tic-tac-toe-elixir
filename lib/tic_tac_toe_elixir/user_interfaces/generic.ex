defmodule TicTacToeElixir.UserInterfaces.Generic do
  @behaviour TicTacToeElixir.UserInterfaces.UserInterface
  def print(message) do
    IO.puts(message)
  end

  def get_user_input do
    String.strip(IO.gets "")
  end

  def prompt_and_validate(message, valid?) do
    print(message)
    input = get_user_input
    case valid?.(input) do
      true -> input
      false -> prompt_and_validate(message, valid?)
    end
  end
end
