require 'rails_helper'

RSpec.feature "admin can see dashboard" do
  scenario "with all orders" do
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 1)
    order3 = Fabricate(:order, status: 2)
    order4 = Fabricate(:order, status: 3)

    admin = Fabricate(:user, role: 1)
    login_as(admin)

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("All Orders")

    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Completed: 1")

    expect(page).to have_link("#{order1.id}", href: "/orders/#{order1.id}")
    expect(page).to have_link("#{order2.id}", href: "/orders/#{order2.id}")
    expect(page).to have_link("#{order3.id}", href: "/orders/#{order3.id}")
    expect(page).to have_link("#{order4.id}", href: "/orders/#{order4.id}")

    expect(page).to have_link("Ordered")
    expect(page).to have_link("Paid")
    expect(page).to have_link("Cancelled")
    expect(page).to have_link("Completed")

    expect(page).to have_link("cancel")
    expect(page).to have_link("mark as paid")
    expect(page).to have_link("mark as completed")
  end

  scenario "and click to see ordered items" do
    order1 = Fabricate(:order, status: 0)
    order2 = Fabricate(:order, status: 0)

    admin = Fabricate(:user, role: 1)
    login_as(admin)

    click_link "Ordered"
    expect(current_path).to eq(admin_orders_ordered_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see paid items" do
    order1 = Fabricate(:order, status: 1)
    order2 = Fabricate(:order, status: 1)

    admin = Fabricate(:user, role: 1)
    login_as(admin)

    click_link "Paid"
    expect(current_path).to eq(admin_orders_paid_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see cancelled items" do
    order1 = Fabricate(:order, status: 2)
    order2 = Fabricate(:order, status: 2)

    admin = Fabricate(:user, role: 1)
    login_as(admin)

    click_link "Cancelled"
    expect(current_path).to eq(admin_orders_cancelled_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end

  scenario "and click to see completed items" do
    order1 = Fabricate(:order, status: 3)
    order2 = Fabricate(:order, status: 3)

    admin = Fabricate(:user, role: 1)
    login_as(admin)

    click_link "Completed"
    expect(current_path).to eq(admin_orders_completed_path)
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
  end
end
