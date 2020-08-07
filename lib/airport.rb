require_relative 'plane'
class Airport
  attr_accessor :landed_planes
  def initialize
    @landed_planes = []
  end
  def land(plane)
    @landed_planes.append(plane)
    puts "#{plane} had landed"
  end
  def take_off(plane)
    @landed_planes.delete(plane)
    puts "#{plane} has departed"
  end
  def in_airport(plane)
    if @landed_planes.contains(plane)
      true
    else
      false
    end
  end
end