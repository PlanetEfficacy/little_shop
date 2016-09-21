# As an authenticated Admin, when I visit an individual order page



require 'rails_helper'

RSpec.feature "admin views order" do
  scenario "admin sees order and purchaser information" do
    admin = Fabricate(:user, role: 1)
    login_as(admin)
    order = Fabricate(:order)
    expect(order.user).to_not eq(admin)
    # As an authenticated Admin, when I visit an individual order page
    visit order_path(order)
    # Then I can see the order's date and time.
    expect(page).to have_content(order.created_at)
    # And I can see the purchaser's full name and address.
    expect(page).to have_content(order.user.user_profile.full_name)
    expect(page).to have_content(order.user.user_profile.address)

    # And I can see, for each item on the order:
    within(".order_items") do
      item = order.items.first
      item_order = order.item_orders.first
      # - The item's name, which is linked to the item page.
      expect(page).to have_link(item.title, href: item_path(item))
      # - Quantity in this order.
      expect(page).to have_content(item_order.quantity)
      # - Price
      expect(page).to have_content(item.dollars)
      # - Line item subtotal.
      expect(page).to have_content(item_order.subtotal)
    end

    within(".order_info") do
      # And I can see the total for the order.
      expect(page).to have_content(order.total)
      # And I can see the status for the order.
      expect(page).to have_content(order.status)
    end
  end
end
