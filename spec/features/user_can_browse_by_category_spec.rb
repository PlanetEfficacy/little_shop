# Background: I have two categories with titles and each has two different items assigned
#
#   As a visitor
#   When I visit "/:CATEGORY_NAME"
#   I see all items assigned to that category
require 'rails_helper'

RSpec.feature "visitor can browse by category" do
  scenario "visitor can see existing items in a single category" do

    category_1 = Category.create(name: "writing implements")
    category_2 = Category.create(name: "combinatory tools")

    item_1 = category_2.items.create(title: "Paperclip", description: "This is an overpriced paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    item_2 = category_2.items.create(title: "Stapler", description: "This is an overpriced stapler!", price: 2000, image_url: "http://www.thinkgeek.com/images/products/zoom/61b7_swingline_stapler.jpg")
    item_3 = category_1.items.create(title: "Pen", description: "This is an overpriced pen!", price: 3000, image_url: "http://www.gloscricket.co.uk/wp-content/uploads/2013/05/DSC_GCCC-Pen.jpg")
    item_4 = category_1.items.create(title: "Pencil", description: "This is an overpriced pen!", price: 3500, image_url: "http://www.gloscricket.co.uk/wp-content/uploads/2013/05/DSC_GCCC-Pen.jpg")

    visit category_path(category_1)

    expect(page).to have_css(".item", count: 2)
    expect(page).to have_content("All items for writing implements:")

  end

end
