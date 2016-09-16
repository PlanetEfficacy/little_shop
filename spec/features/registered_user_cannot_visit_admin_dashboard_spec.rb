require 'rails_helper'

RSpec.feature "admin user dashboard" do
  scenario "a registered user gets a 404 when visiting admin/dashboard" do
      # As a registered user
      user = Fabricate(:user)
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Login"
      # When I visit "/admin/dashboard"
      visit admin_dashboard_path
      # I get a 404
      expect(page.status_code).to be(404)

      within ".panel-danger" do
        expect(page).to have_content("The page you were looking for doesn't exist.")
        expect(page).to have_link("Back to the Waddams Emporium")
      end
  end
end
