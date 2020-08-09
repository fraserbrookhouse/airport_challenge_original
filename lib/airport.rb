require_relative 'plane'

class Airport
  attr_accessor :landed_planes
  attr_accessor :weather

  def initialize(current_weather = 'clear')
    @landed_planes = []
    @weather = current_weather
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
end
