require( 'pry' )

class Room

  attr_reader :name, :capacity
  attr_accessor :songs, :guests

  def initialize(room_name, capacity)
    @name = room_name
    @songs = []
    @guests = []
    @capacity = capacity
  end

  def check_in(guest)
    if @guests.length < @capacity
      @guests << guest
    else
      return "Sorry, the room is full"
    end
  end

  def check_in_group(guests)
    if guests.length + @guests.length < @capacity
      @guests.concat(guests)
    else
      return "Sorry, the room is full"
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

end
