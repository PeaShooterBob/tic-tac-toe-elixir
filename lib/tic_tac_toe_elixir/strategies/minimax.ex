defmodule TicTacToeElixir.Strategies.Minimax do
  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(marker, board) do

  end

  def minimax(marker, board, maximizing_player, rules, board_evaluator) do
    case rules.over?(board, board_evaluator) do
      true -> score(board, maximizing_player, rules, board_evaluator)
    end
  end

  defp score(board, maximizing_player, rules, board_evaluator) do
    case rules.tied?(board, board_evaluator) do
      true -> 0
      false ->
        case maximizing_player do
          true -> 10
          false -> -10
        end
    end
  end
end
