require 'rails_helper'

RSpec.feature "admin logs in" do
  scenario "admin sees admin dashboard when logged in" do
    admin = User.create(username: "admin", password: "admin", role: 1)
    login_as(admin)
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("The All-Powerful Admin Dashboard")
  end
end
