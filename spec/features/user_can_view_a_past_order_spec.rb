require 'rails_helper'

RSpec.feature "user can view a past order" do
  scenario "user can view a past order" do
    order = Fabricate(:order)
    item = order.items.first
    user = order.user

    login_as(user)
    visit orders_path
    expect(page).to have_content("Past Orders")
    expect(page).to have_link("View", href: "/orders/#{order.id}")
    click_link "View"

    expect(current_path).to eq(order_path(order.id))
    expect(page).to have_content(item.title)
    expect(page).to have_link(item.title, href: "/items/#{item.id}")
    expect(page).to have_content("Status:")
    expect(page).to have_content("Completed")
    expect(page).to have_content("Total:")
    expect(page).to have_content("#{order.total}")
    expect(page).to have_content("Order Submitted:")
    expect(page).to have_content("#{order.created_at}")
    expect(page).to have_content("Completed On:")
    expect(page).to have_content("#{order.updated_at}")
  end
end
