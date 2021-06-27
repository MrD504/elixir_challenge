defmodule BlackJack.CLI do
  alias BlackJack.{State, CLI}

  def play() do
    BlackJack.start(&CLI.handle/2)
  end

  def start_game(state) do
    {:ok, s} = State.event(state, {:choose_p1, :p1})
    handle(s, :request_move)
  end

  def handle(%State{status: :game_over} = state) do
    IO.puts("Game over")
    IO.puts("Score: #{state.game.players_score}")
    {:ok, %State{state | winner: state.game.players_score <= 21}}
  end

  def handle(%State{status: :playing} = state, :request_move) do
    # automatically draw 2 cards

    show(state.game.players_hand, state.game.players_score)
    next_move = IO.gets("(h)it or (s)tick?") |> String.trim()

    case next_move do
      "h" ->
        {:ok, state} = State.event(state, {:take_turn})

        cond do
          state.status == :game_over ->
            handle(state)

          true ->
            handle(state, :request_move)
        end

      _ ->
        {:ok, state} = State.event(state, {:end_game})
        handle(state)
    end
  end

  def show([], 0) do
    IO.puts("You are yet to make a move")
  end

  def show(hand, score) when length(hand) > 0 do
    IO.inspect(hand)
    IO.puts(score)
  end
end
