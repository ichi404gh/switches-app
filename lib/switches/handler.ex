defmodule Switches.Handler do
  use GenServer

  defp default_state do
    %{1 => :off, 2 => :off, 3 => :off, 4 => :off, 5 => :off}
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, default_state(), opts)
  end

  @impl GenServer
  def init(_arg) do
    {:ok, default_state()}
  end

  @impl GenServer
  def handle_call({:toggle, number, value}, _from, state) when value in [:on, :off] and number in 1..5 do
    new_state = %{state | number => value}
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call(:lookup, _from, state) do
    {:reply, state, state}
  end

  # Public api

  def lookup() do
    GenServer.call(__MODULE__, :lookup)
  end

  def toggle(number, value) do
    GenServer.call(__MODULE__, {:toggle, number, value})
  end
end
