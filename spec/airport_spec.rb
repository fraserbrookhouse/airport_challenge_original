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
      allow(subject).to receive(:weather?) { true }
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to include(plane)
    end
    it 'throws an error when plane tries to land if airport is full' do
      allow(subject).to receive(:weather?) { true }
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full, no space to land'
    end
    it 'throws an error when plane tries to land in stormy weather' do
      allow(subject).to receive(:weather?) { false }
      expect { subject.land Plane.new }.to raise_error 'Weather not suitable for landing'
    end
  end
  describe '#take_off' do
    it 'removes plane from landed_planes array' do
      allow(subject).to receive(:weather?) { true }
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).not_to include(plane)
    end
    it 'throws an error if plane tries to take off but weather is stormy' do
      allow(subject).to receive(:weather?) { false }
      expect { subject.take_off Plane.new }.to raise_error 'Weather not suitable for flight'
    end
  end
  describe '#change_capacity' do
    it 'changes @airport_capacity to the integer it is passed, 30 in this case' do
      airport = Airport.new
      airport.change_capacity(30)
      expect(airport.airport_capacity).to eq 30
    end
  end
  describe '#full?' do
    it 'responds false if landed_planes count is less than airport_capacity' do
      airport = Airport.new('clear', 20)
      plane = Plane.new
      airport.land(plane)
      expect(airport.full?).to eq false
    end
  end
  describe '#safe_land?' do
    it 'responds true when weather is not stormy and airport is not full' do
      allow(subject).to receive(:weather?) { true }
      expect(subject.safe_land?).to eq true
    end
    it 'responds false when weather? is false' do
      allow(subject).to receive(:weather?) { false }
      expect(subject.safe_land?).to eq false
    end
    it 'responds false when full? is false' do
      allow(subject).to receive(:weather?) { true }
      20.times { subject.land Plane.new }
      expect(subject.safe_land?).to eq false
    end
  end
  describe '#safe_takeoff?' do
    it 'responds true when weather? equals true' do
      allow(subject).to receive(:weather?) { true }
      expect(subject.safe_takeoff?).to eq true
    end
  end
  describe '#weather?' do
    it 'responds true when weather is not stormy' do
      allow(subject).to receive(:weather?) { true }
      expect(subject.weather?).to eq true
    end
  end
end
