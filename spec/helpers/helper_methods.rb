def login_as(user)
  visit login_path
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
end

def fill_in_title
  fill_in "Title", with: "ItemTitle"
end

def fill_in_description
  fill_in "Description", with: "ItemDescription"
end

def check_category
  check "#{@category.name}"
end

def fill_in_price
  fill_in "Price", with: 109.45
end

def expect_not_saved
  expect(page).to have_content("Item could not be saved.")
end
