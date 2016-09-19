Fabricator(:order) do
  status 3
  total { Faker::Commerce.price }
  user
  item_orders(count: 2)
end
