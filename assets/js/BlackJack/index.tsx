import React, { useState, useEffect } from "react";
import socket, { channel } from "../socket";

const BlackJack = () => {
  const [score, setScore] = useState(0);
  const [gameOver, setGameOver] = useState(false);

  useEffect(() => {
    if (score > 21) {
      setGameOver(true);
    }
  }, [score]);

  useEffect(() => {
    // handle initial setup
    if (score === 0) {
      return;
    }

    if (score > 21) {
      alert("Bust!");
      return;
    }

    alert("You win!");
  }, [gameOver]);

  const handleHit = () => {
    channel.push("hit_me", {});
  };

  const handleStick = () => {
    setGameOver(true);
  };

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
        <button onClick={handleStick}>stick</button>
      </div>
      <div style={{ color: "white", padding: "5px", margin: "5px" }}>
        Score: {score}
      </div>
    </section>
  );
};

export default BlackJack;
