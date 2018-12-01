require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../guest' )
require_relative( '../room' )
require_relative( '../song' )

class GuestTest < MiniTest::Test

  def setup
    @song1  = Song.new("Hurt")

    @guest1 = Guest.new("Jeff", 30, @song1)

  end

  def test_guest_has_name
    assert_equal("Jeff", @guest1.name)
  end

  def test_guest_has_money
    assert_equal(30, @guest1.wallet)
  end

 def test_guest_paid_fee
   assert_equal(20, @guest1.enter_guest(10))
 end

 def test_guest_has_favourite_song
   assert_equal(@song1, @guest1.favourite_song)
 end

 def test_guests_song_in_playlist
   # arrange
   room = Room.new("Song Room", 5)
   room.add_song(@song1)
   room.check_in(@guest1)
   assert_equal("Wooo!", @guest1.cheer_song(room))
 end


end
