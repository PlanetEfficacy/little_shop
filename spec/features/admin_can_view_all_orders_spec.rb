require 'rails_helper'

RSpec.feature "admin can see dashboard" do
  before(:each) do

  end

  scenario "with all orders" do
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 1)
    order3 = Fabricate(:order, status: 2)
    order4 = Fabricate(:order, status: 3)
    # As a logged in Admin
    admin = Fabricate(:user, role: 1)

    login_as_admin(admin)
     #when I visit the dashboard
    expect(current_path).to eq(admin_dashboard_path)
    #then I can see a listing of all orders
    expect(page).to have_content("All Orders")
    # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Completed: 1")
    # And I can see a link for each individual order
    expect(page).to have_link("#{order1.id}", :href => "/orders/#{order1.id}")
    expect(page).to have_link("#{order2.id}", :href => "/orders/#{order2.id}")
    expect(page).to have_link("#{order3.id}", :href => "/orders/#{order3.id}")
    expect(page).to have_link("#{order4.id}", :href => "/orders/#{order4.id}")
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    expect(page).to have_link("Ordered", admin_orders_ordered_path)
    expect(page).to have_link("Paid", admin_orders_paid_path)
    expect(page).to have_link("Cancelled", admin_orders_cancelled_path)
    expect(page).to have_link("Completed", admin_orders_completed_path)
    # And I have links to transition between statuses
    # - I can click on "cancel" on individual orders which are "paid" or "ordered"
    expect(page).to have_link("cancel", admin_orders_cancelled_path)
    # - I can click on "mark as paid" on orders that are "ordered"
    expect(page).to have_link("mark as paid", admin_orders_paid_path)
    # - I can click on "mark as completed" on orders that are "paid"
    expect(page).to have_link("mark as completed", admin_orders_completed_path)
  end

  scenario "and click to see ordered items" do
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 0)

    admin = Fabricate(:user, role: 1)
    # As a logged in Admin

    login_as_admin(admin)
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    click_link "Ordered"
    expect(current_path).to eq(admin_orders_ordered_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see paid items" do
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    order1 = Fabricate(:order, status: 1)
    order2 = Fabricate(:order, status: 1)

    admin = Fabricate(:user, role: 1)
    # As a logged in Admin

    login_as_admin(admin)
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    click_link "Paid"
    expect(current_path).to eq(admin_orders_paid_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see cancelled items" do
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    order1 = Fabricate(:order, status: 2)
    order2 = Fabricate(:order, status: 2)

    admin = Fabricate(:user, role: 1)
    # As a logged in Admin

    login_as_admin(admin)
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    click_link "Cancelled"
    expect(current_path).to eq(admin_orders_cancelled_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see completed items" do
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    order1 = Fabricate(:order, status: 3)
    order2 = Fabricate(:order, status: 3)

    admin = Fabricate(:user, role: 1)
    # As a logged in Admin
    
    login_as_admin(admin)
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    click_link "Completed"
    expect(current_path).to eq(admin_orders_completed_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end
end
