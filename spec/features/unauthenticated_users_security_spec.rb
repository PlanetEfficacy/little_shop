require 'rails_helper'

RSpec.feature "unauthenticated user" do
  scenario "cannot view another user's private data" do
    order_1 = Fabricate(:order)
    visit order_path(order_1)
    expect(page).to_not have_css("td", :text => order_1.id)
    expect(current_path).to eq(login_path)
  end

  scenario "is redirected to login/create account when attempting to checkout" do
    item = Fabricate(:item)
    visit item_path(item)
    click_button "Add to Cart"
    click_link "Cart"

    expect(page).to have_link("Login or Create Account to Checkout")
    expect(page).to_not have_button("Checkout")

    click_link "Login or Create Account to Checkout"

    expect(current_path).to eq(login_path)
  end

  scenario "gets 404 error when visiting admin pages" do
    visit admin_dashboard_path
    expect_404_doesnt_exist
  end
end
