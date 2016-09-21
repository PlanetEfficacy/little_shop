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

def expect_to_see_logout
  expect(page).to have_content("Logout")
  expect(page).to have_no_content("Login")
end

def expect_to_see_login
  expect(page).to have_content("Login")
  expect(page).to have_no_content("Logout")
end

def select_stars(num)
  select num, from: "stars"
end

def fill_in_review_body
  fill_in "Body", with: "This is my review."
end

def expect_404_doesnt_exist
  expect(page.status_code).to be(404)

  within ".panel-danger" do
    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to have_link("Back to the Waddams Emporium")
  end
end
