defmodule BlackJack.Game do
  alias BlackJack.{Game, Deck}

  def take_turn(game, player) when player == :p1 do
    game
    |> draw_card()
  end

  def draw_card(game) do
    [active_card | rest_of_deck] = game.deck

    new_hand = update_players_hand(game.players_hand, active_card)

    %{
      game
      | deck: update_deck(active_card, rest_of_deck),
        players_hand: new_hand,
        players_score: calculate_score(new_hand, 0)
    }
  end

  def calculate_score([], acc), do: acc

  def calculate_score([head | tail], acc) do
    points = get_card_value(head.name, acc)
    calculate_score(tail, acc + points)
  end

  def get_card_value(card, current_score) do
    # if current_score is > 11 ace = 1
    case card do
      "Ace" ->
        if current_score > 11, do: 1, else: 11

      "Two" ->
        2

      "Three" ->
        3

      "Four" ->
        4

      "Five" ->
        5

      "Six" ->
        6

      "Seven" ->
        7

      "Eight" ->
        8

      "Nine" ->
        9

      "Ten" ->
        10

      "Jack" ->
        10

      "Queen" ->
        10

      "King" ->
        10

      _ ->
        0
    end
  end

  def update_deck(active_card, rest_of_deck) do
    rest_of_deck ++ [active_card]
  end

  def update_players_hand(current_hand, new_card) do
    current_hand ++ [new_card]
  end

  def move_card_to_back_of_deck(deck) do
    [head | rest_of_deck] = deck
    rest_of_deck ++ head
  end

  @derive {Jason.Encoder, except: []}
  defstruct players_score: 0,
            dealers_score: 0,
            win_condition_met: false,
            over: false,
            deck: [],
            players_hand: [],
            dealers_hand: []

  def new do
    %Game{deck: Deck.new()}
  end
end
