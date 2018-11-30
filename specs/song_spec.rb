require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../song' )

class SongsTest < MiniTest::Test

  def setup
    @song = Song.new("Londons Calling")
  end

  def test_song_has_name
    assert_equal("Londons Calling", @song.name)
  end




end
