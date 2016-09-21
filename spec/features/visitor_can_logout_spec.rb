# As a logged in user
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"

require 'rails_helper'

RSpec.feature "visitor can logout" do
  scenario "visitor can logout from item index page" do
    user = Fabricate(:user)
    # As a logged in user
    visit root_path
    login_as(user)
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
    user = Fabricate(:user)
    category = Fabricate(:category)
    # As a logged in user
    visit category_path(category)
    # require "pry"; binding.pry

    login_as(user)
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
