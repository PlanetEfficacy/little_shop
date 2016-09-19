require 'rails_helper'

RSpec.feature "admin can create items" do
  scenario "admin successfully creates item" do
    # As an authenticated Admin:
    admin = Fabricate(:user, role: 1)
    category_1 = Fabricate(:category)
    category_2 = Fabricate(:category)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    # I can create an item.
    expect(current_path).to eq(admin_dashboard_path)
    click_link "Create an Item"
    expect(current_path).to eq(new_item_path)
    # - An item must have a title, description and price.
    fill_in "Title", with: "ItemTitle"
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 10945
    # - An item must belong to at least one category.
    check "#{category_1.name}"
    check "#{category_2.name}"

    click_button "Create New Item"
    expect(current_path).to eq(item_path(Item.last))
    expect(page).to have_content("Item was successfully saved.")
    expect(page).to have_content("ItemTitle")
    expect(page).to have_content("ItemDescription")
    expect(page).to have_content("$109.45")

    # - The title and description cannot be empty.
    # - The title must be unique for all items in the system.
    # - The price must be a valid decimal numeric value and greater than zero.
    # - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
  end

  scenario "admin cannot create item without title" do
    admin = Fabricate(:user, role: 1)
    category_1 = Fabricate(:category)
    category_2 = Fabricate(:category)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

    click_link "Create an Item"
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 10945
    check "#{category_1.name}"
    click_button "Create New Item"
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item could not be saved.")

    # - The title and description cannot be empty.
    # - The title must be unique for all items in the system.
    # - The price must be a valid decimal numeric value and greater than zero.
    # - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
  end





  scenario "visitor cannot create item" do
  end

  scenario "logged-in user cannot create item" do
  end


end
