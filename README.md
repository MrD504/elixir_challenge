# BlackJack

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

Brief
Implement a React app that allows users to play a game of (simplified) blackjack.

As this role will also involve some Elixir on the backend, bonus points for hosting this app inside a Phoenix application https://www.phoenixframework.org/ - the default Phoenix template comes with Webpack etc.,

When presenting it you could use https://ngrok.com/ and ideally put the code on Github (or whatever you prefer) so we can look at the source code as well.

The rules
The (simplified) rules of blackjack are as follows:

A player requests cards. If their total exceeds 21, they automatically lose. They can 'stick' at any time, which restarts their hand.

We will use a full deck of cards, minus the jokers. This means:

ACE, 2, 3, 4, 5, 6, 7, 8, 9, Jack, Queen, King

And the suits:

Club, Spade, Heart, Diamond

...for a total of 52 cards.

ACE may represent 1 or 11, but initially let's just assume it always represents 1. 2, 3, 4, 5, 6, 7, 8, 9 represent their normal numerical value. JACK, QUEEN and KING represent 10.

The suit has no bearing on the value of the card in the game.

Considerations
There is no 'win' condition - no need for the computer to track this. Simply notify the user if they won, lost or drew.
The interface doesn't have to be beautiful
A player should be able to perform the following interactions with the app:
'hit' - take another card
'stick' - end the round on their current score.
Extra tasks
The app should ideally track the 'deck' of cards rather than just issuing random cards. Therefore once a card is 'used' it should go back onto the back of the deck.
Aces can be 1 or 11 and your app should calculate the best hand automatically
