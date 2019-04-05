require 'bike'

describe Bike do

it 'repsonds to working?' do
expect(subject).to respond_to :working?
end

it 'reports a broken bike' do
  bike = Bike.new
  subject.report_bike
  expect(subject).to be_broken
end

end
