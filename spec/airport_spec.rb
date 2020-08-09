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
  it 'responds to attr_accessor for weather' do
    expect(subject).to respond_to(:weather)
  end
  it 'responds to attr_accessor for airport_capacity' do
    expect(subject).to respond_to(:airport_capacity)
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
      expect(subject.landed_planes).not_to include(plane)
    end
    it 'throws an error if plane tries to take off but weather is stormy' do
      airport = Airport.new('stormy')
      expect { airport.take_off Plane.new }.to raise_error 'Weather not suitable for flight'
    end
  end
  describe '#full?' do
    it 'responds false if landed_planes count is less than aiport_capacity' do
      airport = Airport.new('clear', 20)
      plane = Plane.new
      airport.land(plane)
      expect(airport.full?).to eq false
    end
  end
  describe '#safe_land?' do
    it 'responds true when weather is not stormy and airport is not full' do
    end
  end
  describe '#safe_takeoff?' do
    it 'responds true when weather? equals true' do
      expect(subject.safe_takeoff?).to eq true
    end
  end
  describe '#weather?' do
    it 'responds true when weather is not stormy' do
      expect(subject.weather?).to eq true
    end
  end
end
