defmodule TicTacToeElixir.Configure do
  use Application
  alias TicTacToeElixir.Boards.TicTacToe, as: Board
  alias TicTacToeElixir.Evaluators.TicTacToe, as: BoardEvaluator
  alias TicTacToeElixir.Games.Game, as: Game
  alias TicTacToeElixir.MessageFactories.TicTacToe, as: MessageFactory
  alias TicTacToeElixir.Rules.TicTacToe, as: Rules
  alias TicTacToeElixir.Strategies.Minimax, as: Strategy
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator

  def start(_type, _args) do
    Game.start(Rules, Board, BoardEvaluator, MessageFactory, UserInterface, Validator, Strategy)
  end
end
