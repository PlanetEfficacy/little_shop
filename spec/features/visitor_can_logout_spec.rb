# As a logged in user
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"

require 'rails_helper'

RSpec.feature "visitor can logout" do
  scenario "visitor can logout from item index page" do
    user = User.create(username: "kevin_user", password: "password")
    # As a logged in user
    visit root_path
    click_link "Login"
    fill_in "Username", with: "kevin_user"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_no_content("Login")
    # When I click "Logout"
    click_link "Logout"
    # Then I should see see "Login"
    # And I should not see "Logout"
    expect(current_path).to eq(items_path)
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end

  scenario "visitor can logout from categories page" do
    user = User.create(username: "kevin_user", password: "password")
    category = Category.create(name: "x")
    # As a logged in user
    visit category_path(category)
    click_link "Login"
    fill_in "Username", with: "kevin_user"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_no_content("Login")
    # When I click "Logout"
    click_link "Logout"
    # Then I should see see "Login"
    # And I should not see "Logout"
    expect(current_path).to eq(items_path)
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end

end
