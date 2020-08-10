require_relative 'plane'

class Airport
  attr_accessor :landed_planes
  attr_accessor :weather
  attr_accessor :airport_capacity

  def initialize(default_capacity = 20)
    @landed_planes = []
    @weather = 'sunny'
    @airport_capacity = default_capacity
  end

  def change_capacity(num)
    @airport_capacity = num
  end

  def land(plane)
    raise 'Weather not suitable for landing' if weather? == false
    raise 'Airport full, no space to land' if full?
    raise 'Plane has already landed at airport' if landed_planes.include?(plane)

    @landed_planes.append(plane)
    puts "#{plane} has landed"
  end

  def take_off(plane)
    raise 'Weather not suitable for flight' unless weather?
    raise 'Plane is not currently at this airport' unless landed_planes.include? plane

    @landed_planes.delete(plane)
    puts "#{plane} has departed"
  end

  private

  def in_airport(plane)
    if @landed_planes.include? plane
      true
    else
      false
    end
  end

  def full?
    landed_planes.count >= airport_capacity
  end

  def weather?
    possible_weather = %w[sunny cloudy raining stormy]
    @weather = possible_weather[rand(1..4)]
    @weather != 'stormy'
  end
end
