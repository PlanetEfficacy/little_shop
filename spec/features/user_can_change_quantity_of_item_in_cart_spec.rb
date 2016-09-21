require 'rails_helper'

RSpec.feature "visitor can change quantity of item in the cart" do
  scenario "visitor sees the updated quantity and updated subtotal in cart" do
    item = Fabricate(:item)
    visit items_path
    click_on "Add to Cart"
    visit cart_path
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("1")
    end
    click_button "increase"
    expect(current_path).to eq("/cart")
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("2")
    end
    within(".invoice_item") do
      expect(page).to have_content("$#{2 * item.price}")
    end
    within(".invoice_total") do
      expect(page).to have_content("$#{2 * item.price}")
    end
    click_on "decrease"
    expect(current_path).to eq("/cart")
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("1")
    end
    within(".invoice_item") do
      expect(page).to have_content("$#{item.price}")
    end
    within(".invoice_total") do
      expect(page).to have_content("$#{item.price}")
    end
  end
end
