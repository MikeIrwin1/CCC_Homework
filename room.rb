require( 'pry' )

class Room

  attr_reader :name, :capacity, :entry_fee
  attr_accessor :songs, :guests, :money_earned

  def initialize(room_name, capacity)
    @name = room_name
    @songs = []
    @guests = []
    @capacity = capacity
    @entry_fee = 10
    @money_earned = 0
  end

  def check_in(guest)
    if @guests.length < @capacity
      @guests << guest
      guest.enter_guest(@entry_fee)
      @money_earned += @entry_fee
    else
      return "Sorry, the room is full"
    end
  end

  def check_in_group(guests)
    if guests.length + @guests.length < @capacity
      @guests.concat(guests)
      guests.each{|guest| guest.enter_guest(@entry_fee)}
      @money_earned += guests.length * @entry_fee
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
