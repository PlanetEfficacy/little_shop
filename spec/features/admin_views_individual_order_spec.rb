require 'rails_helper'

RSpec.feature "admin views order" do
  scenario "admin sees order and purchaser information" do
    admin = Fabricate(:user, role: 1)
    login_as(admin)
    order = Fabricate(:order)
    expect(order.user).to_not eq(admin)

    visit order_path(order)
    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.user.user_profile.full_name)
    expect(page).to have_content(order.user.user_profile.address)

    within(".order_items") do
      item = order.items.first
      item_order = order.item_orders.first
      expect(page).to have_link(item.title, href: item_path(item))
      expect(page).to have_content(item_order.quantity)
      expect(page).to have_content(item.dollars)
      expect(page).to have_content(item_order.subtotal)
    end

    within(".order_info") do
      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
    end
  end
end
