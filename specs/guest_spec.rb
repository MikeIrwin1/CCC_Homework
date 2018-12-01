require( 'minitest/autorun' )
require( 'minitest/rg' )

require_relative( '../guest' )

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jeff", 30, "Hurt")
    @guest2 = Guest.new("Mark", 40, "Song 2")
    @guest3 = Guest.new("Stacy", 60, "Romeo")
    @guest4 = Guest.new("Jon", 10, "Heart of Courage")
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

end
