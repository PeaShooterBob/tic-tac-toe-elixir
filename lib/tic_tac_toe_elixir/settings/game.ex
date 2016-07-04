defmodule TicTacToeElixir.Settings.Game do
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def get(settings, key) do
    Agent.get(settings, &Map.get(&1, key))
  end

  def put(settings, key, value) do
    Agent.update(settings, &Map.put(&1, key, value))
  end
end
