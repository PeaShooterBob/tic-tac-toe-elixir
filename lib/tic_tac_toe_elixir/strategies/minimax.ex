defmodule TicTacToeElixir.Strategies.Minimax do
  alias TicTacToeElixir.Games.Marker, as: Marker

  @behaviour TicTacToeElixir.Strategies.Strategy

  def best_move(marker, board, rules, board_evaluator) do
    move_scores = move_scores(marker, board, rules, board_evaluator)
    move_scores
    |> best_move_score
    |> elem(0)
  end

  defp minimax(marker, board, maximizing_player, original_depth, depth, rules, board_evaluator) do
    case rules.over?(board, board_evaluator) ||
    serach_depth_reached?(original_depth, depth) do
      true -> score(board, maximizing_player, rules, board_evaluator)
      false ->
        marker = opposite_marker(marker)
        maximizing_player = !maximizing_player
        case maximizing_player do
          true ->
            children_board_scores(marker, board, maximizing_player, original_depth, rules, board_evaluator)
            |> Enum.max
          false ->
            children_board_scores(marker, board, maximizing_player, original_depth, rules, board_evaluator)
            |> Enum.min
        end
    end
  end

  defp move_scores(marker, board, rules, board_evaluator) do
    empty_spaces = empty_spaces(board, board_evaluator)
    original_depth = depth(board, board_evaluator)
    scores = children_board_scores(marker, board, true, original_depth, rules, board_evaluator)
    Enum.zip(empty_spaces, scores)
  end

  defp best_move_score(move_scores) do
    Enum.max_by(move_scores, fn (move_score) ->
      elem(move_score, 1)
    end)
  end

  defp children_board_scores(marker, board, maximizing_player, original_depth, rules, board_evaluator) do
    empty_spaces = empty_spaces(board, board_evaluator)
    Enum.map(empty_spaces, fn (space) ->
      board = List.replace_at(board, space, marker)
      depth = depth(board, board_evaluator)
      minimax(marker, board, maximizing_player, original_depth, depth, rules, board_evaluator)
    end)
  end

  defp score(board, maximizing_player, rules, board_evaluator) do
    case rules.won?(board, board_evaluator) do
      true ->
        case maximizing_player do
          true -> 10
          false -> -10
        end
      false -> 0
    end
  end

  defp serach_depth_reached?(original_depth, depth) do
    original_depth - depth > 4
  end

  defp depth(board, board_evaluator) do
    empty_spaces = empty_spaces(board, board_evaluator)
    length(empty_spaces)
  end

  defp opposite_marker(marker) do
    cond do
      marker == Marker.x_marker -> Marker.o_marker
      marker == Marker.o_marker -> Marker.x_marker
    end
  end

  defp empty_spaces(board, board_evaluator) do
    Enum.filter(board, fn(space) -> !board_evaluator.space_filled?(space) end)
  end
end
