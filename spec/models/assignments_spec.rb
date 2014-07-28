require 'rails_helper'

describe Assignment do
  before do
    @kristi = create_person
    @location = create_location
  end
  it 'will save a valid assignment' do
    assignment = Assignment.create(person_id: @kristi.id, location_id: @location.id, role: 'Manager')
    expect(assignment).to be_valid
  end

  it 'will not save an assignment without a role' do
    assignment = Assignment.create(person_id: @kristi.id, location_id: @location.id, role: '')
    expect(assignment).to_not be_valid
  end

  it 'needs to have a unique role within a location' do
    assignment = Assignment.create(person_id: @kristi.id, location_id: @location.id, role: 'Manager')
    assignment1 = Assignment.create(person_id: @kristi.id, location_id: @location.id, role: 'Manager')
    expect(assignment).to be_valid
    expect(assignment1).to_not be_valid
  end
end