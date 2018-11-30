require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../guest' )

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Jeff")
  end

  def test_guest_has_name
    assert_equal("Jeff", @guest.name)
  end




end
