
require 'rails_helper'

RSpec.feature "visitor can change quantity of item in the cart" do
  scenario "visitor sees the updated quantity and updated subtotal in cart" do
    # Background: Cart has an item in it
    item = Fabricate(:item)
    visit items_path
    click_on "Add to Cart"
    # When I visit "/cart"
    visit cart_path
    # Then I should see my item with a quantity of 1
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("1")
    end
    # And when I increase the quantity
    click_button "increase"
    # Then my current page should be '/cart'
    expect(current_path).to eq("/cart")
    # And that item's quantity should reflect the increase
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("2")
    end
    # And the subtotal for that item should increase
    within(".invoice_item") do
      expect(page).to have_content("$#{2 * item.price}")
    end
    # And the total for the cart should match that increase
    within(".invoice_total") do
      expect(page).to have_content("$#{2 * item.price}")
    end
    # And when I decrease the quantity
    click_on "decrease"
    # Then my current page should be '/cart'
    expect(current_path).to eq("/cart")
    # And that item's quantity should reflect the decrease
    within(".invoice_item") do
      expect(page).to have_content(item.title)
      expect(page).to have_content("1")
    end
    # And the subtotal for that item should decrease
    within(".invoice_item") do
      expect(page).to have_content("$#{item.price}")
    end
    # And the total for the cart should match that decrease
    within(".invoice_total") do
      expect(page).to have_content("$#{item.price}")
    end
  end
end
