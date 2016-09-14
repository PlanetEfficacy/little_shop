# As a visitor
# When I visit "/cart"
# Then I should see my item with a quantity of 1
# And when I increase the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the increase
# And the subtotal for that item should increase
# And the total for the cart should match that increase
# And when I decrease the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the decrease
# And the subtotal for that item should decrease
# And the total for the cart should match that decrease

require 'rails_helper'

RSpec.feature "visitor can change quantity of item in the cart" do
  scenario "visitor sees the updated quantity and updated subtotal in cart" do
    # Background: Cart has an item in it
    Fabricate(:item)
    visit items_path
    click_on "Add to Cart"


  end
end
