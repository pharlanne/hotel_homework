require('minitest/autorun') 
require_relative("../hotel")
require_relative("../room")
require_relative("../guest")


class TestHotel < MiniTest::Test

  def setup

    @hotel = Hotel.new()
    @hotel.add_room(1, "single", 50,5) #adding singles to hotel (use  .new in )
    @hotel.add_room(2, "double", 100,10) #... method only to create new rooms
                      #@hotel.rooms[0..15] [0..5] are singles
  

  end


  def test_add_room
    @hotel.add_room(2, "double", 100, 3)
    @hotel.add_room(1, "single", 50, 2)
    assert_equal( 20, @hotel.rooms.length )
  end

  def test_hotel_max_guests_capacity
    assert_equal(25,@hotel.max_guests_capacity)
  end

  def test_current_number_of_guests_in_hotel
    guest1 = Guest.new("martin")
    guest2 = Guest.new("martin")
    guest3 = Guest.new("smith")
    @hotel.rooms[5].add_guests([guest1,guest2])
    @hotel.rooms[0].add_guests([guest3])
    assert_equal(3, @hotel.current_number_of_guests)

  end
   def test_hotel_current_occupancy
    assert_equal(3/25*100,@hotel.calculate_occupancy)
   end


   def test_total_hotel_revenue
    guest1 = Guest.new("martin")
    guest2 = Guest.new("martin")
    guest3 = Guest.new("smith")
    @hotel.rooms[5].add_guests([guest1,guest2])
    @hotel.rooms[0].add_guests([guest3])
    assert_equal(150, @hotel.calculate_revenue)
   end
end