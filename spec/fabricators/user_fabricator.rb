Fabricator(:user) do
  username { Faker::Name.name + (Faker::Number.between(1, 9)).to_s }
  password "password"
  user_profile
end
