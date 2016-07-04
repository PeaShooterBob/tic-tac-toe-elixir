defmodule TicTacToeElixir.UserInterfaces.UserInterface do
  @callback print(String.message) :: any
  @callback get_user_input :: any
end
