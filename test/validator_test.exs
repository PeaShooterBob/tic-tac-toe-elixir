defmodule ValidatorTest do
  use ExUnit.Case
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "Validator.valid_move?/2" do
    test "returns true if move is valid" do
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.valid_move?(8, board) == true
    end

    test "returns false if move is not valid" do
      board = [Marker.x_marker, 1, 2, 3, 4, 5, 6, 7,8]
      assert Validator.valid_move?(0, board) == false
    end

    test "returns false if move is not part of board" do
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.valid_move?(200, board) == false
    end

    test "returns false if move is a marker" do
      board = [Marker.x_marker, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.valid_move?(Marker.x_marker, board) == false
    end
  end
end
