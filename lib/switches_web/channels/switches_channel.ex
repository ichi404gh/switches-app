defmodule SwitchesWeb.SwitchesChannel do
  use Phoenix.Channel

  def join("switches", _message, socket) do
    {:ok, socket}
  end

  def handle_in("toggle", %{"number" => number, "value" => value}, socket) do
    state = Switches.Handler.toggle(number, (if value, do: :on, else: :off))
    broadcast!(socket, "update", state)
    {:noreply, socket}
  end
end