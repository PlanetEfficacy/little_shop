require 'rails_helper'

RSpec.feature "authenticated user" do
  scenario "cannot view another user's private data" do
    # As an authenticated user
    order_1 = Fabricate(:order)
    order_2 = Fabricate(:order)
    user = order_1.user

    login_as(user)
    # I cannot view another user's private data (current or past orders, etc)
    visit orders_path

    within ".table" do
      expect(page).to have_link("View", :href => order_path(order_1))
      expect(page).to_not have_link("View", :href => order_path(order_2))
    end
  end

  scenario "cannot view admin screens and functionality" do
    # As an authenticated user
    user = Fabricate(:user)
    login_as(user)
    # I cannot view the adminsitrator screens or use admin functionality
    visit admin_dashboard_path

    expect(page.status_code).to be(404)
  end

  scenario "cannot make themselves an admin" do
    # As an authenticated user
    user = Fabricate(:user)
    login_as(user)
    expect(page).not_to have_content("Become Admin")
  end
end
