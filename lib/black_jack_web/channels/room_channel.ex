defmodule BlackJackWeb.RoomChannel do
  use Phoenix.Channel
  alias BlackJack.State

  def join("room:game", _message, socket) do
    {:ok, socket}
  end

  def handle_in("start_game", _, socket) do
    {:ok, s} = BlackJack.GUI.play()

    broadcast!(socket, "new_game", %{body: s})
    {:noreply, socket}
  end

  def handle_in("hit_me", %{"body" => state}, socket) do
    # get next card
    {:ok, s} = State.event(state, {:take_turn})

    encoded_state =
      s
      |> Jason.encode!()

    broadcast!(socket, "new_card", %{body: encoded_state})
    {:noreply, socket}
  end
end
