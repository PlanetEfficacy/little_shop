require 'rails_helper'

RSpec.feature "visitor can remove item from cart" do
  scenario "visitor doesn't see the item in the cart after removing" do

    item = Fabricate(:item)
    visit items_path
    click_on "Add to Cart"
    click_on "View Cart"
    click_on "Remove"

    expect(current_path).to eq('/cart')
    expect(page).to have_content("Successfully removed #{item.title} from your cart.")
    expect(page).to have_link("#{item.title}", :href => "/items/#{item.id}")

    within(".invoice_item") do
      expect(page).not_to have_content(item.title)
      expect(page).not_to have_content(item.description)
      expect(page).not_to have_content(item.price)
    end

    within(".invoice_total") do
      expect(page).to have_content("Total: $0.00")
    end
  end
end
