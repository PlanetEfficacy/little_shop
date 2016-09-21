def login_as_admin(admin)
  visit login_path
  fill_in "Username", with: admin.username
  fill_in "Password", with: admin.password
  click_button "Login"
end
