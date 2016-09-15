# As an Authenticated User
#  When I visit "/orders"
#  Then I should see all orders belonging to me and no other orders
#

require 'rails_helper'

RSpec.feature "authenticated user can view all past orders" do
  scenario "user visits orders path and sees all user orders" do

    user = Fabricate(:user)
    visit orders_path(user)
    expect(page).to have_css(".orders")
  end
end
