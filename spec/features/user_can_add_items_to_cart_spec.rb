# As a visitor
# When I visit any page with an item on it
# I should see a link or button for "Add to Cart"
# When I click "Add to cart" for that item
# And I click a link or button to view cart
# And my current path should be "/cart"
# And I should see a small image, title, description and price for the item I just added
# And there should be a "total" price for the cart that should be the sum of all items in the cart
require 'rails_helper'

RSpec.feature "visitor can browse by category" do
  scenario "visitor can see existing items in a single category" do

    category_1 = Category.create(name: "writing implements")
    category_2 = Category.create(name: "combinatory tools")

    item_1 = category_2.items.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    item_2 = category_2.items.create(title: "Stapler", description: "This is an overpriced stapler!", price: 2000, image_url: "http://www.thinkgeek.com/images/products/zoom/61b7_swingline_stapler.jpg")
    item_3 = category_1.items.create(title: "Pen", description: "This is an artisinal pen!", price: 3000, image_url: "http://www.gloscricket.co.uk/wp-content/uploads/2013/05/DSC_GCCC-Pen.jpg")
    item_4 = category_1.items.create(title: "Pencil", description: "This is an artisinal pencil!", price: 3500, image_url: "http://pngimg.com/upload/pencil_PNG3861.png")

    visit category_path(category_1)

    expect(page).to have_css(".item", count: 2)
    expect(page).to have_content("All items for writing implements:")

  end

end
