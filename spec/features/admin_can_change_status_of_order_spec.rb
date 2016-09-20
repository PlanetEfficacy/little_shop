require 'rails_helper'

RSpec.feature "admin can change status of order" do


  # scenario "with all orders" do
  #   admin = Fabricate(:user, role: 1)
  #   @order1 = Fabricate(:order, status: 0)
  #   @order2 = Fabricate(:order, status: 1)
  #   @order3 = Fabricate(:order, status: 2)
  #   @order4 = Fabricate(:order, status: 3)
  #
  #   visit login_path
  #   fill_in "Username", with: admin.username
  #   fill_in "Password", with: admin.password
  #   click_button "Login"
  #
  #   # As a logged in Admin
  #   #when I visit the dashboard
  #   expect(current_path).to eq(admin_dashboard_path)
  #   #then I can see a listing of all orders
  #   expect(page).to have_content("All Orders")
  #   # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
  #   expect(page).to have_content("Ordered: 1")
  #   expect(page).to have_content("Paid: 1")
  #   expect(page).to have_content("Cancelled: 1")
  #   expect(page).to have_content("Completed: 1")
  #   # And I can see a link for each individual order
  #   expect(page).to have_link("#{order1.id}", :href => "/orders/#{order1.id}")
  #   expect(page).to have_link("#{order2.id}", :href => "/orders/#{order2.id}")
  #   expect(page).to have_link("#{order3.id}", :href => "/orders/#{order3.id}")
  #   expect(page).to have_link("#{order4.id}", :href => "/orders/#{order4.id}")
  #   # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
  #   expect(page).to have_link("Ordered", admin_orders_ordered_path)
  #   expect(page).to have_link("Paid", admin_orders_paid_path)
  #   expect(page).to have_link("Cancelled", admin_orders_cancelled_path)
  #   expect(page).to have_link("Completed", admin_orders_completed_path)
    # # And I have links to transition between statuses
    # # - I can click on "cancel" on individual orders which are "paid" or "ordered"
    # expect(page).to have_link("cancel", admin_orders_cancelled_path)
    # # - I can click on "mark as paid" on orders that are "ordered"
    # expect(page).to have_link("mark as paid", admin_orders_paid_path)
    # # - I can click on "mark as completed" on orders that are "paid"
    # expect(page).to have_link("mark as completed", admin_orders_completed_path)
  # end
  scenario "and clicking the cancel link associated with an order changes the order status to cancelled" do

    admin = Fabricate(:user, role: 1)
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 0)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

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

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

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

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

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
