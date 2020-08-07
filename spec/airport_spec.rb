require 'airport'

describe Airport do
  it 'should exist' do
    expect(subject).to be_instance_of Airport
  end
  it 'responds to method land' do
    expect(subject).to respond_to(:land)
  end
  it 'responds to method take_off' do
    expect(subject).to respond_to(:take_off)
  end
  it 'responds to attr_accessor for landed_planes' do
    expect(subject).to respond_to(:landed_planes)
  end

  describe '#land' do
    it 'adds plane to landed_planes array' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to include(plane) 
    end
  end
  describe '#take_off' do
    it 'removes plane from landed_planes array' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).to not_include(plane)
    end
  end
end