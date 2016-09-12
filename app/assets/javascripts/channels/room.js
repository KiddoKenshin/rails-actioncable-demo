App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('connected');
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected');
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var split = data.message.split('||');
    var template = '<tr valign="top"><td class="timestamp">::TIMESTAMP::</td><td>::STRING::</td></tr>';
    var append = template.replace('::TIMESTAMP::', split[0]).replace('::STRING::', split[1]);
    $('table#log').append(append);
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});
