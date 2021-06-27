defmodule BlackJack.GUI do
  alias BlackJack.{State, GUI}

  def play() do
    BlackJack.start(&GUI.handle/2)
  end

  def handle(%State{status: :playing} = state, :request_move) do
    {:ok, state}
  end
end
