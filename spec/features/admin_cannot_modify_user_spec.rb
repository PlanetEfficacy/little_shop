require 'rails_helper'

RSpec.feature "admin cannot modify users" do
  scenario "admin can modify their own account data" do
    admin = Fabricate(:user, role: 1)
    user = Fabricate(:user)
    expect(admin.admin?).to eq(true)

    login_as(admin)
    expect(current_path).to eq(admin_dashboard_path)

    click_link "Account"
    expect(current_path).to eq(edit_admin_user_path)

    within "form" do
      expect(find_field('Username').value).to eq(admin.username)
      fill_in "Username", with: 'admin!'
      fill_in "Current password", with: admin.password
      fill_in "New password", with: 'super_secret'
      fill_in "Confirm new password", with: 'super_secret'
      click_button "Update"
    end

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('admin!')

    click_link "Logout"
    click_link "Login"
    fill_in "Username", with: 'admin!'
    fill_in "Password", with: 'super_secret'
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).not_to have_content(user.username)
  end
end
