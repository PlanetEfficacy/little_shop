require 'rails_helper'

RSpec.feature "admin cannot modify users" do
  scenario "admin can modify their own account data" do
    # As a logged in Admin
    admin = Fabricate(:user, role: 1)
    user = Fabricate(:user)
    expect(admin.admin?).to eq(true)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    expect(current_path).to eq(admin_dashboard_path)

    # I can modify my account data
    click_link "Account"
    expect(current_path).to eq(edit_admin_user_path)
    # save_and_open_page
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

    # But I cannot modify any other user's account data
    expect(page).not_to have_content(user.username)


  end
end
