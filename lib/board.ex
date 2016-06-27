defmodule Board do
  def create(dimmension) do
    end_index = size_of_board(dimmension) - 1
    Enum.to_list(0..end_index)
  end

  def mark(board, space, marker) do
    List.replace_at(board, space, marker)
  end

  defp size_of_board(dimmension) do
    dimmension * dimmension
  end
end
