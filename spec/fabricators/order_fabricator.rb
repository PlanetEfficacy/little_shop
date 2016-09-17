Fabricator(:order) do
  status 3
  total { Faker::Commerce.price }

  user
  items(count: 2)
end
