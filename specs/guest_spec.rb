require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../guest' )

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Jeff", 30)
  end

  def test_guest_has_name
    assert_equal("Jeff", @guest.name)
  end

  def test_guest_has_money
    assert_equal(30, @guest.wallet)
  end


end
