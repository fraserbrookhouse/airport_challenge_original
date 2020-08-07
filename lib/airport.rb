require_relative 'plane'
class Airport
  @landed_planes = []
  def land(plane)
    @landed_planes.append(plane)
  end
  def take_off

  end
end