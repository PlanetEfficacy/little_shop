require 'rails_helper'

RSpec.feature "visitor can add item to cart and then see it in the cart" do
  scenario "visitor can add item to cart from item index" do
    item = Fabricate(:item)
    visit items_path

    expect(page).to have_button("Add to Cart")

    click_on "Add to Cart"
    click_on "View Cart"

    expect(current_path).to eq('/cart')
    within(".invoice_item") do
      expect(page).to have_css('.thumbnail')
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
    end

    within(".invoice_total") do
      expect(page).to have_content("Total: $#{item.price}")
    end
  end
end
