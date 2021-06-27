import "../css/app.scss";
import React from "react";
import ReactDOM from "react-dom";
import BlackJack from "./BlackJack";

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("BlackJack");
  if (!container) return;
  ReactDOM.render(<BlackJack />, container);
});
