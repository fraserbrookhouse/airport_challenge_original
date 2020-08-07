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
  describe '#land' do
    it 'takes lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
    it 'adds plane to landed_planes array' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to include(plane) 
    end
  end
end