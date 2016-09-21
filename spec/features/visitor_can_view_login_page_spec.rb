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
