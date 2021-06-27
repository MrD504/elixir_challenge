defmodule BlackJack.Web do
  alias BlackJack.{State, Web}

  def play() do
    BlackJack.start(&Web.handle/2)
  end

  def handle(%State{status: :playing} = state, :request_move) do
    state
    |> IO.puts()
  end
end
