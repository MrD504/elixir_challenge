defmodule BlackJack.Card do
  alias BlackJack.Card

  @enforce_keys [:suite, :name]
  defstruct [:suite, :name]

  def new(suite, name) do
    %Card{suite: suite, name: name}
  end
end
