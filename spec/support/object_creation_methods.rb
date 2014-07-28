def create_user(overrides = {})
  User.create!({
                 name: 'Some User',
                 email: 'user@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end

def create_assignment(overrides = {})
  Assignment.create!({
                       role: 'Manager'
                     }.merge(overrides))
end

def create_location(overrides = {})
  Location.create!({
                     name: 'Texas'
                   }.merge(overrides))
end

def create_person(overrides = {})
  Person.create!({
                   first_name: 'Kristi',
                   last_name: 'Trombly'
                 }.merge(overrides))
end
