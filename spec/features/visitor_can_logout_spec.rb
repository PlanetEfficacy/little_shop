require 'rails_helper'

RSpec.feature "visitor can logout" do
  scenario "visitor can logout from item index page" do
    user = Fabricate(:user)
    visit root_path
    login_as(user)

    expect(current_path).to eq(dashboard_path)
    expect_to_see_logout

    click_link "Logout"

    expect(current_path).to eq(items_path)
    expect_to_see_login
  end

  scenario "visitor can logout from categories page" do
    user = Fabricate(:user)
    category = Fabricate(:category)
    visit category_path(category)
    login_as(user)

    expect(current_path).to eq(dashboard_path)
    expect_to_see_logout
    click_link "Logout"

    expect(current_path).to eq(items_path)
    expect_to_see_login
  end

end
