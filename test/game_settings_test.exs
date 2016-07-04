defmodule GameSettingsTest do
  use ExUnit.Case
  alias TicTacToeElixir.Settings.Game, as: Settings

  setup do
    {:ok, settings} =  Settings.start_link
    {:ok, settings: settings}
  end

  describe "Settings.put/3" do
    test "it can get and set settings", %{settings: settings} do
      Settings.put(settings, :strategy, "Hard Strategy")
      assert Settings.get(settings, :strategy) == "Hard Strategy"
    end
  end
end
