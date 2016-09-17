require 'rails_helper'

RSpec.feature "logged in user can checkout and unlogged in user cannot" do
  scenario "user is required to login before checking out" do
  item = Fabricate(:item)
  user = Fabricate(:user)
  # As a visitor
  visit items_path
  expect(page).to have_button("Add to Cart")
  # When I add items to my cart
  click_on "Add to Cart"
  # And I visit "/cart"
  click_on "View Cart"
  # And I click "Login or Create Account to Checkout"
  click_on "Login or Create Account to Checkout"
  # Then I should be required to login
  expect(current_path). to eq "/login"
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
  # When I am logged in
  # And I visit my cart
  click_on "View Cart"
  # And when I click "Checkout"
  click_on "Checkout"
  # Then the order should be placed --> MAGIC
  # And my current page should be "/orders"
  expect(current_path).to eq "/orders"
  # And I should see a message "Order was successfully placed"
  expect(page).to have_content("Order was successfully placed")
  # And I should see the order I just placed in a table
  expect(page).to have_content(user.orders.last.items.first.title)

  end

end
