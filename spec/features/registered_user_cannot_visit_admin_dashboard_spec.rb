require 'rails_helper'

RSpec.feature "admin user dashboard" do
  scenario "a registered user gets a 404 when visiting admin/dashboard" do
      user = Fabricate(:user)
      login_as(user)
      visit admin_dashboard_path
      expect_404_doesnt_exist
  end

  scenario "a unregistered user gets a 404 when visiting admin/dashboard" do
      visit admin_dashboard_path
      expect_404_doesnt_exist
    end
end
