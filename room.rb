class Room 
  attr_reader :capacity, :type, :rate, :occupants
  def initialize( capacity, type, rate )
    @capacity = capacity
    @type = type
    @rate = rate
    @occupants=[]
  end

  def add_guests(guests)
    if @occupants.empty?
      for guest in guests   #adding guests to rooms
        @occupants<<guest
      end
    else
      puts "this room is occupied"
      return false  # for double booking
    end
  end

  def remove_guests()
    @occupants = []
  end
end