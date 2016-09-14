require 'rails_helper'

RSpec.feature "visitor can add item to cart and then see it in the cart" do
  scenario "visitor can add item to cart from item index" do

    item_1 = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")

    # As a visitor
    # When I visit any page with an item on it
    visit items_path
    # I should see a link or button for "Add to Cart"
    expect(page).to have_button("Add to Cart")
    # When I click "Add to cart" for that item
    click_on "Add to Cart"
    # And I click a link or button to view cart
    click_on "View Cart"
    # And my current path should be "/cart"
    
    expect(current_path).to eq('/cart')
    # And I should see a small image, title, description and price for the item I just added
    within(".invoice_item") do
      expect(page).to have_css('.thumbnail')
      expect(page).to have_content("Paperclip")
      expect(page).to have_content("This is an artisinal paperclip")
      expect(page).to have_content("$50.00")
    end
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    within(".invoice_total") do
      expect(page).to have_content("Total: $50.00")
    end
  end


  scenario "visitor can see item in cart with total" do
  end

end
