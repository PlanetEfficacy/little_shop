# As a visitor
# When I visit "/"
# Then I should see a link for "Login"
# And when I click "Login"
# And I should be on the "/login" page
# I should see a place to insert my credentials to login
# And I should see a link to "Create Account"

require 'rails_helper'

RSpec.feature "visitor visits login page" do
  scenario "visitor can see Create Account link and login form" do

    visit root_path
    expect(page).to have_link("Login")
    click_link "Login"
    expect(current_path).to eq(login_path)
    expect(page).to have_css("form")
    expect(page).to have_link("Create Account")
  end
end
