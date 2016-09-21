require 'rails_helper'

RSpec.feature "authenticated user can view all past orders" do
  scenario "user visits orders path and sees all user orders" do
    order = Fabricate(:order)
    user = order.user

    login_as(user)

    visit orders_path
    expect(page).to have_css(".orders")
  end
end
