require_relative 'plane'

class Airport
  attr_accessor :landed_planes
  attr_accessor :weather
  attr_accessor :airport_capacity

  def initialize(current_weather = 'clear', default_capacity = 20)
    @landed_planes = []
    @weather = current_weather
    @airport_capacity = default_capacity
  end

  def change_capacity(num)
    @airport_capacity = num
  end

  def land(plane)
    raise 'Airport full, no space to land' if full?

    raise 'Weather not suitable for landing' unless weather?

    @landed_planes.append(plane)
    puts "#{plane} has landed"
  end

  def take_off(plane)
    raise 'Weather not suitable for flight' unless weather?

    @landed_planes.delete(plane)
    puts "#{plane} has departed"
  end

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

  def safe_takeoff?
    weather? == true
  end

  def weather?
    possible_weather = %w[sunny cloudy raining stormy]
    @weather = possible_weather[rand(1..4)]
    p @weather
    weather != 'stormy'
  end
end
