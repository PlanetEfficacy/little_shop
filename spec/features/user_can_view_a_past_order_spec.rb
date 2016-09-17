# As an authenticated user
#   When I visit "/orders"
#   Then I should see my past order
#   And I should see a link to view that order
#   And when I click that link
#   Then I should see each item that was order with the quantity and line-item subtotals
#   And I should see links to each item's show page
#   And I should see the current status of the order **(ordered, paid, cancelled, completed)**
#   And I should see the total price for the order
#   And I should see the date/time that the order was submitted
#   If the order was completed or cancelled
#   Then I should see a timestamp when the action took place

require 'rails_helper'

RSpec.feature "visitor can remove item from cart" do
  scenario "visitor doesn't see the item in the cart after removing" do
    # As an authenticated user
    # user = Fabricate(:user)

    order = Fabricate(:order)

    # binding.pry

    # order = user.orders.first
    item = order.items.first
    user = order.user

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    #   When I visit "/orders"
    visit orders_path
      #   Then I should see my past order
    expect(page).to have_content("Past Orders")
      #   And I should see a link to view that order
    expect(page).to have_link("View", :href => "/orders/#{order.id}")
      #   And when I click that link
    click_link "View"
      #   Then I should see each item that was ordered with the quantity and line-item subtotals
    expect(current_path).to eq(order_path(order.id))
      #   And I should see links to each item's show page
    expect(page).to have_content(item.title)
    expect(page).to have_link(item.title, :href => "/items/#{item.id}")
      #   And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    expect(page).to have_content("Status:")
    expect(page).to have_content("Completed")
      #   And I should see the total price for the order
    expect(page).to have_content("Total:")
    expect(page).to have_content("#{order.total}")
      #   And I should see the date/time that the order was submitted
    expect(page).to have_content("Order Submitted:")
    expect(page).to have_content("#{order.created_at}")
      #   If the order was completed or cancelled
      #   Then I should see a timestamp when the action took place
    expect(page).to have_content("Completed On:")
    expect(page).to have_content("#{order.updated_at}")
  end
end
