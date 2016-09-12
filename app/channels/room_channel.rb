# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    now = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    data_string = now + '||' + data['message']
    
    path = '/tmp/my_test'
    File.open(path, 'a+') { |f| f.write(data_string + "\n") }
    
    ActionCable.server.broadcast 'room_channel', message: data_string
  end
end
