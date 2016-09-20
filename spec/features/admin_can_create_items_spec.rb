require 'rails_helper'

    # - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)

RSpec.feature "admin can create items" do
  before(:each) do
    admin = Fabricate(:user, role: 1)
    @category_1 = Fabricate(:category)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"

    click_link "Create an Item"
  end

  scenario "admin successfully creates item" do
    expect(current_path).to eq(new_item_path)
    fill_in "Title", with: "ItemTitle"
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 109.45
    check "#{@category_1.name}"
    click_button "Create New Item"

    expect(page).to have_content
    expect(current_path).to eq(item_path(Item.last))
    expect(page).to have_content("Item was successfully saved.")
    expect(page).to have_content("ItemTitle")
    expect(page).to have_content("ItemDescription")
    expect(page).to have_content("$109.45")
  end

  scenario "admin cannot create item without title" do
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 109.45
    check "#{@category_1.name}"
    click_button "Create New Item"
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item could not be saved.")
  end

  scenario "admin cannot create item without description" do
    fill_in "Title", with: "ItemTitle"
    fill_in "Price", with: 109.45
    check "#{@category_1.name}"
    click_button "Create New Item"
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item could not be saved.")
  end

  scenario "admin cannot create item with duplicate title" do
    item = Fabricate(:item)
    fill_in "Title", with: item.title
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 109.45
    check "#{@category_1.name}"
    click_button "Create New Item"
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item could not be saved.")
  end

  scenario "admin cannot create free item" do
    fill_in "Title", with: "ItemTitle"
    fill_in "Description", with: "ItemDescription"
    fill_in "Price", with: 0
    check "#{@category_1.name}"
    click_button "Create New Item"
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item could not be saved.")
  end
end


RSpec.feature "non-admins cannott create items" do
  scenario "visitor cannot create item" do
    visit new_item_path
    expect(current_path).to eq(login_path)
  end

  scenario "logged-in user cannot create item" do
    user = Fabricate(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"

    visit new_item_path
    expect(page.status_code).to be(404)

  end
end
