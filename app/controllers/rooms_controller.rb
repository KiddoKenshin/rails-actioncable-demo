class RoomsController < ApplicationController
  def show
    a = File.read('/tmp/my_test')
    @chats = a.split("\n")
  end
end
