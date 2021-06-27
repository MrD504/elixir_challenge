defmodule BlackJack.Card do
  alias BlackJack.Card

  @derive {Jason.Encoder, only: [:suit, :name]}
  @enforce_keys [:suit, :name]
  defstruct [:suit, :name]

  def new(suit, name) do
    %Card{suit: suit, name: name}
  end
end
