Fabricator(:item_order) do
  order
  item
  quantity { Faker::Number.digit }
end
