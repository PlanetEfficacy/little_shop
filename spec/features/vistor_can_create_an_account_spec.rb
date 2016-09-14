# As a visitor
# When I visit "/login
# And when I click link "Create Account"
# And I fill in my desired credentials
# And I submit my information
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"

require 'rails_helper'

RSpec.feature "visitor creates account" do
  scenario "visitor sees dashboard with own profile information and a logout button" do

    visit login_path
    click_on "Create Account"
    expect(current_path).to eq (new_user_path)
    # first and last name? thinking about shipping addresses in future cards...
    fill_in "Name", with: "Kevin"
    fill_in "Username", with: "Kevin1"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Create Account"
    expect(current_path).to eq(dashboard_path)
    # flash message?
    expect(page).to have_content("Logged in as Kevin")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

  end
end
