
$(document).ready(function(){
  var user = $('#user_div').data('user');
  App.appearence = App.cable.subscriptions.create({channel: "ChatEngine::AppearenceChannel",user_id: user}, {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
  
    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
    }
  });
});
