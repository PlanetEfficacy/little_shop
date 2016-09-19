# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Item.destroy_all

2.times { Category.create(
   name: Faker::Commerce.product_name
  )}

5.times { Item.create(
  title: Faker::Commerce.product_name,
  description: Faker::Hipster.sentence,
  image_url: Faker::Placeholdit.image,
  price: (Faker::Commerce.price.to_f * 1000).to_s,
  categories: Category.where(name: Category.first.name)
  ) }

5.times { Item.create(
  title: Faker::Commerce.product_name,
  description: Faker::Hipster.sentence,
  image_url: Faker::Placeholdit.image,
  price: (Faker::Commerce.price.to_f * 1000).to_s,
  categories: Category.where(name: Category.last.name)
  ) }



# Item.each do |item|
#   if item.id.even?
#     Category.first.
#   else
#     Category.last.
#   end


# end
