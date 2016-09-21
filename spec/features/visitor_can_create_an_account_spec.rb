require 'rails_helper'

RSpec.feature "visitor can create an account" do
  scenario "visitor sees dashboard" do
    visit login_path
    click_link "Create Account"

    expect(current_path).to eq new_user_path
    fill_in "Username", with: "Kevin1"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"

    fill_in "First name", with: "Kevin"
    fill_in "Last name", with: "Smith"
    fill_in "Street address", with: "123 Main St."
    fill_in "City", with: "Anytown"
    select "Ohio", from: "state"
    fill_in "Zipcode", with: "10001"

    click_button "Create Account"
    expect(current_path).to eq dashboard_path

    expect(page).to have_content("Logged in as Kevin1")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
  end

  scenario "visitor sees flash message if pass confirmation does not match" do
    visit new_user_path
    fill_in "Username", with: "Kevin1"
    fill_in "Password", with: "Password1"
    fill_in "Password confirmation", with: "Password2"
    click_button "Create Account"

    expect(current_path).to eq new_user_path
    expect(page).to have_content("Please re-enter your password")
  end
end
