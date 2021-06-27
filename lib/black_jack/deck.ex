defmodule BlackJack.Deck do
  alias BlackJack.Card

  def new do
    new_suit_of_cards()
    |> Enum.shuffle()
  end

  def new_suit_of_cards() do
    suits = ~w(Heart Club Diamond Spade)
    ranks = ~w(
      Ace
      Two
      Three
      Four
      Five
      Six
      Seven
      Eight
      Nine
      Ten
      Jack
      Queen
      King
    )

    for r <- ranks,
        s <- suits,
        do: Card.new(s, r)
  end
end
