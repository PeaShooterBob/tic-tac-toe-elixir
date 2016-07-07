defmodule TicTacToeElixir.Players.Player do
  @callback move(String.marker, List.board, Module.rules, Module.board_evaluator,
   Module.strategy, Module.message_factory, Module.user_interface, Module.validator) :: Integer
end
