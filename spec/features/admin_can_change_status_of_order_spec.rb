require 'rails_helper'

RSpec.feature "admin can change status of order" do
  scenario "and clicking the cancel link associated with an order changes the order status to cancelled" do

    admin = Fabricate(:user, role: 1)
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 0)

    login_as_admin(admin)
    expect(current_path).to eq(admin_dashboard_path)

    expect(Order.cancelled.count).to eq(0)
    within('.admin_orders tr:nth-child(2)')do
      click_link "cancel"
    end
    expect(Order.cancelled.count).to eq(1)
    expect(Order.cancelled.first).to eq(order1)

    expect(current_path).to eq(admin_orders_cancelled_path)
    expect(page).to have_content("Order no.#{order1.id} is now cancelled")
    expect(page).to have_content(order1.id)
    expect(page).to have_no_content(order2.id)
  end

  scenario "and clicking the mark as paid link associated with an order changes the order status to paid" do

    admin = Fabricate(:user, role: 1)
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 0)

    login_as_admin(admin)
    expect(current_path).to eq(admin_dashboard_path)

    expect(Order.paid.count).to eq(0)
    within('.admin_orders tr:nth-child(2)')do
      click_link "mark as paid"
    end
    expect(Order.cancelled.count).to eq(0)
    expect(Order.paid.count).to eq(1)
    expect(Order.paid.first).to eq(order1)

    expect(current_path).to eq(admin_orders_paid_path)
    expect(page).to have_content("Order no.#{order1.id} is now paid")
    expect(page).to have_content(order1.id)
    expect(page).to have_no_content(order2.id)
  end

  scenario "and clicking the mark as completed link associated with an order changes the order status to completed" do

    admin = Fabricate(:user, role: 1)
    order1 = Fabricate(:order, status: 1)

    login_as_admin(admin)
    expect(current_path).to eq(admin_dashboard_path)

    expect(Order.completed.count).to eq(0)
    within('.admin_orders tr:nth-child(2)')do
      click_link "mark as completed"
    end
    expect(Order.completed.count).to eq(1)
    expect(Order.completed.first).to eq(order1)

    expect(current_path).to eq(admin_orders_completed_path)
    expect(page).to have_content("Order no.#{order1.id} is now completed")
    expect(page).to have_content(order1.id)
  end


end
