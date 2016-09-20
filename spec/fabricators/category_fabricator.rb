Fabricator(:category) do
  name { Faker::Commerce.product_name }
  items(count: 5)
  # category_items(count: 5)
end
