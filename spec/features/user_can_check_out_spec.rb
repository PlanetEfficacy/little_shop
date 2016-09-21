require 'rails_helper'

RSpec.feature "logged in user can checkout and unlogged in user cannot" do
  scenario "user is required to login before checking out" do
  item = Fabricate(:item)
  user = Fabricate(:user)
  visit items_path
  expect(page).to have_button("Add to Cart")

  click_on "Add to Cart"
  click_on "View Cart"
  click_on "Login or Create Account to Checkout"

  expect(current_path). to eq "/login"

  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
  click_on "View Cart"
  click_button "Checkout"

  expect(current_path).to eq "/orders"
  expect(page).to have_content("Order was successfully placed")
  expect(page).to have_content(user.orders.first.id)
  end
end
