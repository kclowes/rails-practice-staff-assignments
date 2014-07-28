require 'rails_helper'

describe Person do
  it 'will create a person' do
    person = Person.create(title: 'Mrs.', first_name: 'Keri', last_name: 'Clowes')
    expect(person).to be_valid
  end

  it 'will not allow a person with no first name or title to be saved' do
    person = Person.create(title: '', first_name: '', last_name: 'Clowes')
    expect(person).to_not be_valid
  end

  it 'will not allow a person with no title to be saved' do
    person = Person.create(title: '', first_name: 'Keri', last_name: 'Clowes')
    expect(person).to be_valid
  end

end