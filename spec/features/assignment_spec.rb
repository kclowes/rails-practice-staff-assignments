require 'rails_helper'

feature 'assignment' do

  scenario 'a location can be added, updated and deleted for a person' do
    create_user
    create_location
    Person.create!(first_name: 'Keri', last_name: 'Clowes')
    visit signin_path

    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Login'
    click_on 'Keri Clowes'

    click_on '+ Add Location'
    expect(page).to have_content 'Assign Keri Clowes a Location'
    select 'Texas', from: 'assignment[location_id]'
    fill_in 'assignment[role]', with: 'Manager'
    click_on 'Assign'
    within(".table") do
      expect(page).to have_content('Texas')
      expect(page).to have_content('Manager')
      click_on 'Edit'
    end
    select 'Texas', from: 'assignment[location_id]'
    fill_in 'assignment[role]', with: 'Manager II'
    click_on 'Update'

    within(".table") do
      expect(page).to have_content('Texas')
      expect(page).to have_content('Manager II')
      click_on 'Delete'
    end
    expect(page).to_not have_content('Texas')
    expect(page).to_not have_content('Manager II')

  end

end