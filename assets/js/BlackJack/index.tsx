import React, { useState, useEffect } from "react";
import socket from "../socket";
socket.connect();
let channel = socket.channel("room:game", {});
channel
  .join()
  .receive("ok", (response) => console.log("joined successfully", response));

const BlackJack = () => {
  const [score, setScore] = useState(0);
  const [gameState, setGameState] = useState({});
  const [gameOver, setGameOver] = useState(false);

  useEffect(() => {
    channel.push("start_game", {});
  }, []);

  channel.on("new_game", (gs) => {
    console.log(gs);
  });
  useEffect(() => {
    if (score > 21) {
      setGameOver(true);
    }
  }, [score]);

  const handleHit = () => {
    channel.push("hit_me", {});
  };

  // const handleStick = () => {
  // setGameOver(true);
  // };

  return (
    <section
      style={{ backgroundColor: "green", width: "50vw", height: "50vh" }}
    >
      <h1 style={{ color: "white", textAlign: "center" }}>BlackJack</h1>
      <div style={{ height: "75%" }} id="board">
        board
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "space-around",
        }}
      >
        <button onClick={handleHit}>Hit</button>
        <button>stick</button>
      </div>
      <div style={{ color: "white", padding: "5px", margin: "5px" }}>
        Score: {score}
      </div>
    </section>
  );
};

export default BlackJack;
