defmodule Switches.HandlerTest do
  use ExUnit.Case

  test "switches handler" do
    assert %{1 => :off, 2 => :off, 3 => :off, 4 => :off, 5 => :off} = Switches.Handler.lookup()
    Switches.Handler.toggle 2, :on
    assert %{1 => :off, 2 => :on, 3 => :off, 4 => :off, 5 => :off} = Switches.Handler.lookup()
  end
end
