import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RoomChannel" }, {
  received(data) {
    alert("Hola")
    this.appendLine(data)
  },

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.querySelector("[data-chat-room='Best Room']")
    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data["user"]}</span>
        <span class="body">${data["message"]}</span>
      </article>
    `
  }
})