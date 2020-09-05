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
    var item = '<li class="list-group-item row col-12"><div class="row "><div class="col-auto text-center col-3"><img src="' + data.content.user_avatar_url +'" width="50" height="50" class= "rounded-circle"></div><div class="col"><div class="message-content"><p class="mb-1">' + data.content.message + '</p><div class="text-right"><small class="font-weight-bolder">' + data.user.username + '</small></div></div></div></div></li>'
    $("#chat_list").append(item);
    $('#room_message_message').val('');
    var elmnt = document.getElementById("chat-messages");
    console.log(elmnt.scrollHeight)
    $( "#chat-messages" ).scrollTop(elmnt.scrollHeight);


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