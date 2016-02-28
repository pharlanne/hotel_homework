class Hotel

  attr_reader  :rooms

  def initialize()
    @rooms = []
  end

  def add_room( capacity, type, rate, qty )
    qty.times do
      @rooms << Room.new(capacity, type, rate)
    end
  end

  def add_guest(guest)
    @guests<< guest
  end

  def max_guests_capacity
    total = 0
    for room in  @rooms
      total += room.capacity
    end
    return total
  end

  def current_number_of_guests
    total = 0
    for room in @rooms
      total += room.occupants.length
    end
    return total
  end
  def calculate_occupancy
    return current_number_of_guests/max_guests_capacity*100
  end

  def calculate_revenue
    total = 0 
    for room in @rooms
      if !room.occupants.empty?
        total += room.rate 
      end
    end
    return total
  end
end
