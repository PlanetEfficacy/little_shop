Fabricator(:user_profile) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  street_address { Faker::Address.street_address }
  city  { Faker::Address.city }
  state { Faker::Address.state }
  zipcode { Faker::Address.zip }
end
