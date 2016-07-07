defmodule TicTacToeElixir.Players.Human do
  @behaviour TicTacToeElixir.Players.Player

  def move(marker, board, _rules, _board_evaluator, _strategy, message_factory, user_interface, validator) do
    prompt_and_return_move(marker, board, message_factory, user_interface, validator)
  end

  defp prompt_and_return_move(marker, board, message_factory, user_interface, validator) do
    turn_message = message_factory.turn(marker)
    move = user_interface.prompt_and_validate(turn_message, validate_move(board, validator))
    String.to_integer(move)
  end

  defp validate_move(board, validator) do
    fn(input) -> validator.move?(input, board) end
  end
end
