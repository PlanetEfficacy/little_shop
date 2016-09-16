require 'rails_helper'

# As an Admin
# When I log in
# Then I am redirected to "/admin/dashboard"

RSpec.feature "admin logs in" do
  scenario "admin sees admin dashboard when logged in" do
    admin = User.create(username: "admin", password: "admin", role: 1)
    visit login_path
    fill_in "Username", with: "admin"
    fill_in "Password", with: "admin"
    click_button "Login"
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("The All-Powerful Admin Dashboard")
  end
end
