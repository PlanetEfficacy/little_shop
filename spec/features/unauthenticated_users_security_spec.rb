require 'rails_helper'

RSpec.feature "unauthenticated user security" do
  scenario "unauthenticated users cannot view another user's private data" do
      # As an unauthenticated user
      order_1 = Fabricate(:order)
      order_2 = Fabricate(:order)
      user = order_1.user

      # I cannot view another user's private data (current or past orders, etc)
      visit orders_path

      expect(current_path).to eq(login_path)
  end

  # scenario "authenticated users cannot view admin screens and functionality" do
  #     # As an authenticated user
  #     user = Fabricate(:user)
  #
  #     visit login_path
  #     fill_in "Username", with: user.username
  #     fill_in "Password", with: user.password
  #     click_button "Login"
  #     # I cannot view the adminsitrator screens or use admin functionality
  #     visit admin_dashboard_path
  #
  #     expect(page.status_code).to be(404)
  # end
  #
  # scenario "authenticated user cannot make themselves an admin" do
  #   # As an authenticated user
  #   user = Fabricate(:user)
  #   visit login_path
  #   fill_in "Username", with: user.username
  #   fill_in "Password", with: user.password
  #   click_button "Login"
  #
  #
  # end


end
