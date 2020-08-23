$(function() {
  $('#new_room_message').on('submit', function(event) {
    alert
    event.preventDefault();
      if($('#myMessage').val() == ''){
         alert('Input can not be left blank');
      }
    $(this).find('input[type="text"]').val('');
    $("#chat-messages").load(" #chat-messages");
  });
    $('#new_room_message').on('ajax:success', function(event) {
      event.preventDefault();
        if($('#myMessage').val() == ''){
           alert('Input can not be left blank');
        }
      $(this).find('input[type="text"]').val('');
      $("#chat-messages").load(" #chat-messages");
    });
});