defmodule TicTacToeElixir.Games.Game do
  def prompt_and_validate(message, user_interface, valid?) do
    user_interface.print(message)
    marker = user_interface.get_user_input
    case valid?.(marker) do
      true -> marker
      false -> prompt_and_validate(message, user_interface, valid?)
    end
  end
end
