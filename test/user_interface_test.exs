defmodule UserInterfaceTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToeElixir.UserInterfaces.Generic, as: UserInterface

  describe "UserInterface.print/2" do
    test "uses printer to print message" do
      printed_message = capture_io(fn -> UserInterface.print("Tic tac toe is cool") end)
      assert printed_message == "Tic tac toe is cool\n"
    end
  end
end

