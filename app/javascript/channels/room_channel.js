import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content);
    var item = '<li class="list-group-item list-group-item-info"><div class="row no-gutters"><div class="col-auto text-center"><img src="' + data.content.user_avatar_url +'" width="50" height="50" class= "rounded-circle"></div><div class="col"><div class="message-content"><p class="mb-1">' + data.content.message + '</p><div class="text-right"><small class="text-muted">' + data.content.created_at + '</small></div></div></div></div></li>'
    $("#chat_list").prepend(item);
    
    // Called when there's incoming data on the websocket for this channel
  }
});

var submit_messages;

$(document).on('turbolinks:load', function () {
  submit_messages();
})


submit_messages = function () {
  $("#messages_content").on('keydown', function(event) {
    if(event.keyCode == 13) {
      $('input').click();
      event.target.value = ''
      event.preventDefault();
    }
  })
}