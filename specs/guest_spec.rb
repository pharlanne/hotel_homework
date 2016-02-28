require("minitest/autorun") 
require_relative("../guest")

class TestGuest< MiniTest::Test

  def setup
    @guest = Guest.new( "name",2)
  end
end