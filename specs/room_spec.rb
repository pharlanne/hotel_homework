require('minitest/autorun') 
require_relative('../room')
require_relative('../guest')


class TestRoom< MiniTest::Test

  def setup
    @room = Room.new( 2, 'double', 50 )
    @guest1=Guest.new("smith")
    @guest2=Guest.new("smith")
  end

  def test_add_guests_to_room
    number_of_guests_for_this_room = [@guest1, @guest2]
    @room.add_guests(number_of_guests_for_this_room )
    assert_equal(2,@room.occupants.length)
  end

  def test_try_to_double_book
    number_of_guests_for_this_room = [@guest1, @guest2]
    @room.add_guests(number_of_guests_for_this_room )
    assert_equal(false,@room.add_guests([Guest.new("roberts")]))
  end

  def test_remove_guests_from_room
    number_of_guests_for_this_room = [@guest1, @guest2]
    @room.add_guests(number_of_guests_for_this_room )
    @room.remove_guests
    assert_equal(0,@room.occupants.length)
  end
end