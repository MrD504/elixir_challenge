import { Socket } from "phoenix"

let socket = new Socket("/socket", {params: {}})
socket.connect();

export let channel = socket.channel("room:game", {});
channel.join()


export default socket;