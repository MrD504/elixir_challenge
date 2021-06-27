defmodule BlackJack do
  alias BlackJack.{Game, State}

  @moduledoc """
  BlackJack keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @derive {Jason.Encoder, expect: []}
  def start(ui) do
    {:ok, game} = State.new(ui)
  end

  def check_player(player) do
    case player do
      :p1 -> {:ok, player}
      :dealer -> {:ok, player}
      _ -> {:error, :invalid_player}
    end
  end
end
