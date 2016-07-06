defmodule ValidatorTest do
  use ExUnit.Case
  alias TicTacToeElixir.Validators.TicTacToe, as: Validator
  alias TicTacToeElixir.Games.Marker, as: Marker

  describe "Validator.move?/2" do
    test "returns true if move is valid" do
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.move?("8", board) == true
    end

    test "returns false if move is not valid" do
      board = [Marker.x_marker, 1, 2, 3, 4, 5, 6, 7,8]
      assert Validator.move?("0", board) == false
    end

    test "returns false if move is not part of board" do
      board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.move?("200", board) == false
    end

    test "returns false if move is a marker" do
      board = [Marker.x_marker, 1, 2, 3, 4, 5, 6, 7, 8]
      assert Validator.move?(Marker.x_marker, board) == false
    end
  end

  describe "Validator.marker?/1" do
    test "returns true for x marker" do
      assert Validator.marker?(Marker.x_marker) == true
    end

    test "returns true for o marker" do
      assert Validator.marker?(Marker.o_marker) == true
    end

    test "returns false for invalid marker" do
      assert Validator.marker?("Rook") == false
    end
  end

  describe "Valdiator.game_mode?/1" do
    test "returns true for human vs human game mode" do
      assert Validator.game_mode?("HH") == true
    end

    test "returns true for human vs computer game mode" do
      assert Validator.game_mode?("HC") == true
    end

    test "returns false for invalid game mode" do
      assert Validator.game_mode?("PP") == false
    end
  end
end
