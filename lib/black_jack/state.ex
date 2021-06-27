defmodule BlackJack.State do
  alias BlackJack.{Game, State}
  @players [:p1, :dealer]

  @derive {Jason.Encoder, except: []}
  defstruct status: :initial,
            winner: nil,
            game: Game.new(),
            ui: nil

  def new, do: {:ok, %State{}}
  def new(ui), do: {:ok, %State{ui: ui}}

  def event(%State{status: :initial} = state, {:choose_p1, player}) do
    case BlackJack.check_player(player) do
      {:ok, _} -> {:ok, %State{state | status: :playing}}
      _ -> {:error, :invalid_player}
    end
  end

  def event(%State{status: :playing}, {:play, p}) when p not in @players do
    {:error, :invalid_player}
  end

  def event(%State{status: :playing} = state, {:take_turn}) do
    game = Game.take_turn(state.game, :p1)

    cond do
      game.players_score > 21 ->
        {:ok, %State{state | game: game, winner: false, status: :game_over}}

      game.players_score == 21 ->
        {:ok, %State{state | game: game, winner: true, status: :game_over}}

      true ->
        {:ok, %State{state | game: game}}
    end
  end

  def event(%State{status: :playing} = state, {:end_game}) do
    {:ok, %State{state | status: :game_over, winner: state.game.players_score <= 21}}
  end

  def event(%State{status: :playing} = state, {:check_for_winner, winner}) do
    case winner do
      :p1 -> {:ok, %State{state | status: :game_over, winner: winner}}
      :dealer -> {:ok, %State{state | status: :game_over, winner: winner}}
      _ -> {:error, :invalid_winner}
    end
  end
end
