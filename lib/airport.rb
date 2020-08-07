require_relative 'plane'
class Airport
  attr_accessor :landed_planes
  def initialize
    @landed_planes = []
  end
  def land(plane)
    @landed_planes.append(plane)
  end
  def take_off(plane)
    
  end
end