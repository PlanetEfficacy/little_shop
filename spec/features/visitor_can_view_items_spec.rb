require 'rails_helper'

RSpec.feature "visitor visits homepage" do
  scenario "visitor can see all existing items" do

    Item.create(title: "Paperclip" ,description: "This is an overpriced paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")

    Item.create(title: "Stapler" ,description: "This is an overpriced stapler!", price: 2000, image_url: "http://www.thinkgeek.com/images/products/zoom/61b7_swingline_stapler.jpg")

    Item.create(title: "Pen" ,description: "This is an overpriced pen!", price: 3000, image_url: "http://www.gloscricket.co.uk/wp-content/uploads/2013/05/DSC_GCCC-Pen.jpg")

    visit items_path

    expect(page).to have_css(".item", count: 3)
  end

end
