require_relative 'plane'
class Airport
  @landed_planes = []
  attr_accessor :landed_planes
  def land(plane)
    @landed_planes.push(plane)
  end
  def take_off

  end
end