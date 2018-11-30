require( 'pry' )

class Room

  attr_reader :name
  attr_accessor :songs, :guests

  def initialize(room_name)
    @name = room_name
    @songs = []
    @guests = []
  end

  def check_in(guest)
    if guest.class == Array
      @guests.concat(guest)
    else
      @guests << guest
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

end
