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

  def land(plane)
    @landed_planes.append(plane)
    puts "#{plane} has landed"
  end

  def take_off(plane)
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
    weather != 'stormy'
  end
end
