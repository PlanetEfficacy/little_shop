require 'rails_helper'

RSpec.feature 'admin can change status of order' do
  before :each do
    admin = Fabricate(:user, role: 1)
    @order1 = Fabricate(:order, status: 0)
    @order2 = Fabricate(:order, status: 1)
    login_as_admin(admin)
  end

  scenario 'clicking cancel changes status to cancelled' do
    expect(Order.cancelled.count).to eq(0)
    within('.admin_orders tr:nth-child(2)') { click_link 'cancel' }
    expect(Order.cancelled.count).to eq(1)
    expect(Order.cancelled.first).to eq(@order1)
    expect(current_path).to eq(admin_orders_cancelled_path)
    expect(page).to have_content("Order no.#{@order1.id} is now cancelled")
  end

  scenario 'clicking mark as paid changes status to paid' do
    expect(Order.paid.count).to eq(1)
    within('.admin_orders tr:nth-child(2)') { click_link 'mark as paid' }
    expect(Order.paid.count).to eq(2)
    expect(Order.paid.first).to eq(@order1)
    expect(current_path).to eq(admin_orders_paid_path)
    expect(page).to have_content("Order no.#{@order1.id} is now paid")
  end

  scenario 'clicking completed changes status to competed' do
    expect(Order.completed.count).to eq(0)
    within('.admin_orders tr:nth-child(3)') { click_link 'mark as completed' }
    expect(Order.completed.count).to eq(1)
    expect(Order.completed.first).to eq(@order2)
    expect(current_path).to eq(admin_orders_completed_path)
    expect(page).to have_content("Order no.#{@order2.id} is now completed")
  end
end
