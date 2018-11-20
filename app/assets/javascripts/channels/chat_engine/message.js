// alert();
$(document).ready(function(){
  var chat_id = $('#messages').data('chat_id');
  // alert(chat_id);
  var user = $('#user_div').data('user');
  App.message = App.cable.subscriptions.create(
    {channel: "ChatEngine::MessageChannel", chat_id: chat_id, user_id: user}, {
    connected: function() {
      // alert("message_channel");
      // toastr.info('Are you the 6 fingered man?');
      // Called when the subscription is ready for use on the server
    },
  
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
  
    received: function(data) {
      // alert(data['message']);
      var message = data['message'];
      if(message!= null && data['sender_type']+"_"+data['sender_id'] != user ){
        message = "<div class='chat-left'>" + message + "</div>";
        // alert(message);
        $('#messages').append(message);
      } else
      {
        $('#messages').append(message);
      }
      // alert(message);
      
      $chat = $('.chat-app-window');
   
      height = 1000000000000; 
      $chat.animate({
        scrollTop: height
      });
    // $('#message-body').val("");
   
    

      if ($('#messages').length==0){
        toastr.info(data['notification']);
      }
      if(data['sender_type']+"_"+data['sender_id'] != user ){
        ion.sound.play("pling_sound");
        
      }
      
      
      
      // Called when there's incoming data on the websocket for this channel
    }
  });
});