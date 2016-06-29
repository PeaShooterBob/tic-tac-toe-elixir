defmodule TicTacToeElixir.Boards.Board do
  @callback create(Integer.width, Integer.height) :: List
  @callback mark(List.board, String.space, String.marker) :: List
  @callback rows(List.board) :: List
  @callback columns(List.board) :: List
end
