defmodule GameTest do
  use ExUnit.Case, async: false
  alias TicTacToeElixir.Boards.TicTacToe, as: Board
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator
  alias TicTacToeElixir.Games.Game, as: Game
  alias TicTacToeElixir.Games.Marker, as: Marker
  alias TicTacToeElixir.MessageFactories.TicTacToe, as: MessageFactory
  alias TicTacToeElixir.Players.Human, as: Human
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface
  import Mock


  describe "Game.loop/7" do
    test "it asks a player for their move" do
      all_x_row = [Marker.x_marker, Marker.x_marker, Marker.x_marker]

      with_mock Board,
      [mark: fn(board, space, marker) -> all_x_row end] do
        with_mock BoardEvaluator,
        [rows: fn(board) -> [board] end] do
          with_mock Rules,
          [over?: fn(board, board_evaluator) -> board == all_x_row end] do
            with_mock Human,
            [move: fn(marker, board, settings) -> 2 end] do
              with_mock MessageFactory,
              [board: fn(rows) -> rows |> hd |> tl |> tl |> hd end,
               game_won: fn(marker) -> ~s(#{marker} won) end] do
                with_mock UserInterface,
                [print: fn(message) -> message end] do
                  board = [Marker.x_marker, Marker.x_marker, 2]
                  players = [Human, Human]
                  settings = "some settings"

                  winning_message = Game.loop(Marker.x_marker, board, settings, players, Rules, Board, BoardEvaluator, MessageFactory, UserInterface)

                  assert called BoardEvaluator.rows(board)
                  assert called MessageFactory.board([board])
                  assert called UserInterface.print(2)

                  assert called BoardEvaluator.rows(all_x_row)
                  assert called MessageFactory.board([all_x_row])
                  assert called UserInterface.print(Marker.x_marker)

                  assert called Human.move(Marker.x_marker, board, settings)
                  assert called Board.mark(board, 2, Marker.x_marker)
                  assert called Rules.over?(all_x_row, BoardEvaluator)

                  assert winning_message == "O won"
                end
              end
            end
          end
        end
      end
    end
  end
end

