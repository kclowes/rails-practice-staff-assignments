require 'rails_helper'

feature 'staff show page' do
  scenario 'staff person can be edited' do
    create_user
    visit signin_path

    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'

    click_on 'New Person'
    fill_in 'person[title]', with: 'Mrs.'
    fill_in 'person[first_name]', with: 'Keri'
    fill_in 'person[last_name]', with: 'Clowes'
    click_on 'Create Person'
    click_on 'Keri Clowes'
    expect(page).to have_content 'Keri Clowes'

    click_link 'Edit'
    fill_in 'person[title]', with: 'Mrs.'
    fill_in 'person[first_name]', with: 'Kerilyn'
    fill_in 'person[last_name]', with: 'Clowes'
    click_on 'Update Person'
    expect(page).to have_content('Kerilyn Clowes')
    expect(page).to_not have_content('Keri Clowes')
  end

  scenario 'last name must be present' do
    create_user
    visit signin_path

    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'

    click_on 'New Person'
    fill_in 'person[title]', with: 'Mrs.'
    fill_in 'person[first_name]', with: 'Keri'
    fill_in 'person[last_name]', with: ''
    click_on 'Create Person'
    expect(page).to have_content 'Last name can\'t be blank'
  end

  scenario 'last name must be present' do
    create_user
    visit signin_path

    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'

    click_on 'New Person'
    fill_in 'person[title]', with: ''
    fill_in 'person[first_name]', with: ''
    fill_in 'person[last_name]', with: 'Clowes'
    click_on 'Create Person'
    expect(page).to have_content 'This person could not be created'
  end

  scenario 'user can see how many locations a person has' do
    create_user
    joe = create_person(first_name: 'Joe', last_name: 'Example')
    location = create_location
    create_assignment(person_id: joe.id, location_id: location.id, role: 'Mother')
    visit signin_path

    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'
    within(".table") do
      expect(page).to have_content('Joe Example')
      expect(page).to have_content('1')
    end

  end

end