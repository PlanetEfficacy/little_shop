Fabricator(:item) do
  title { Faker::Commerce.product_name }
  description { Faker::Hipster.sentence }
  image_url { Faker::Placeholdit.image("50x50", 'jpeg', 'ffffff', '000') }
  price { Faker::Commerce.price }

  # category
  # category_item
end
