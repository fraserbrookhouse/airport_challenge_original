require 'airport'

describe Airport do
  it 'should exist' do
    expect(subject).to be_instance_of Airport
  end
  it 'responds to method land' do
    expect(subject).to respond_to(:land)
  end
end