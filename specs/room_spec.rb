require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../room' )
require_relative( '../guest' )
require_relative( '../song' )

class RoomsTest < MiniTest::Test

  def setup
    @room = Room.new("The Twilight Zone", 5)

    @guest1 = Guest.new("Jeff")
    @guest2 = Guest.new("Mark")
    @guest3 = Guest.new("Stacy")
    @guest4 = Guest.new("Jon")

    @song1 = Song.new("Hurt")
    @song2 = Song.new("Romeo")
    @song3 = Song.new("Audacity of Huge")

    @guests = [@guest1, @guest2, @guest3, @guest4]
    @songs = [@song1, @song2, @song3]
  end

  def test_room_has_name
    assert_equal("The Twilight Zone", @room.name)
  end

  def test_room_has_guest__one_guest
    @room.check_in(@guest1)
    assert_equal([@guest1], @room.guests)
  end

  def test_room_has_guest__multiple_guests
    @room.check_in_group(@guests)
    assert_equal(4, @room.guests.length)
  end

  def test_room_has_songs__one_song
    @room.songs << @song1
    assert_equal([@song1], @room.songs)
  end

  def test_room_has_songs__multiple_songs
    @room.songs.concat(@songs)
    assert_equal(3, @room.songs.length)
  end

  def test_room_can_check_out
    # arrange
    @room.check_in_group(@guests)
    # act
    @room.check_out(@guest1)
    # assert
    assert_equal(3, @room.guests.length)
  end

  def test_room_can_add_song
    # arrange
    @room.songs.concat(@songs)
    # act
    @room.add_song(@song1)
    # assert
    assert_equal(4, @room.songs.length)
  end

  def test_room_has_capacity
    assert_equal(5, @room.capacity)
  end

  def test_check_in__room_is_full
    # arrange
    small_room = Room.new("Tiny Room", 2)
    # fill small room with 4 guests (capacity)
    small_room.check_in(@guest1)
    small_room.check_in(@guest2)
    assert_equal("Sorry, the room is full", small_room.check_in(@guest3))
  end

  def test_check_in_group__no_room
    # arrange
    small_room = Room.new("Tiny Room", 3)
    # assert
    assert_equal("Sorry, the room is full", small_room.check_in_group(@guests))
  end

  def test_check_in_group__no_room_two
    # arrange
    small_room = Room.new("Tiny Room", 7)
    small_room.check_in_group(@guests)
    # assert
    assert_equal("Sorry, the room is full", small_room.check_in_group(@guests))
  end

end
