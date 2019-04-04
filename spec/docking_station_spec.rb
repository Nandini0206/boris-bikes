require 'docking_station'
require 'bike'

describe DockingStation do

  it 'releases bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error when there are no bikes available' do
  expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'creates new bike object if bike is working' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'raises an error when the docking station is full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new}
    expect { subject.dock Bike.new }.to raise_error 'Docking station is full'
  end

  it 'allows user to set a larger capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
