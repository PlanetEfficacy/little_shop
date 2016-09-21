require 'rails_helper'

RSpec.feature "admin can create items" do
  before(:each) do
    admin = Fabricate(:user, role: 1)
    @category = Fabricate(:category)
    login_as(admin)
    click_link "Create an Item"
  end

  scenario "admin successfully creates item" do
    expect(current_path).to eq(new_item_path)
    fill_in_title
    fill_in_description
    fill_in_price
    check_category
    click_button "Create New Item"

    expect(page).to have_content
    expect(current_path).to eq(item_path(Item.last))
    expect(page).to have_content("Item was successfully saved.")
    expect(page).to have_content("ItemTitle")
    expect(page).to have_content("ItemDescription")
    expect(page).to have_content("$109.45")
  end

  scenario "admin cannot create item without title" do
    fill_in_description
    fill_in_price
    check_category
    click_button "Create New Item"

    expect(current_path).to eq(new_item_path)
    expect_not_saved
  end

  scenario "admin cannot create item without description" do
    fill_in_title
    fill_in_price
    check_category
    click_button "Create New Item"

    expect(current_path).to eq(new_item_path)
    expect_not_saved
  end

  scenario "admin cannot create item with duplicate title" do
    item = Fabricate(:item)
    fill_in "Title", with: item.title
    fill_in_description
    fill_in_price
    check_category
    click_button "Create New Item"

    expect(current_path).to eq(new_item_path)
    expect_not_saved
  end

  scenario "admin cannot create free item" do
    fill_in_title
    fill_in_description
    fill_in "Price", with: 0
    check_category
    click_button "Create New Item"

    expect(current_path).to eq(new_item_path)
    expect_not_saved
  end

  scenario "admin cannot create item without category" do
    fill_in_title
    fill_in_description
    fill_in_price
    click_button "Create New Item"
    
    expect(current_path).to eq(new_item_path)
    expect_not_saved
  end

  scenario "admin can create item with photo attachment" do
    fill_in_title
    fill_in_description
    fill_in_price
    check_category
    attach_file("Image", Rails.root + "spec/fixtures/dummy.png")

    click_button "Create New Item"
    expect(current_path).to eq(item_path(Item.last))

    expect(page).to have_css(".product-image")
  end
end

RSpec.feature "non-admins cannott create items" do
  scenario "visitor cannot create item" do
    visit new_item_path
    expect(current_path).to eq(login_path)
  end

  scenario "logged-in user cannot create item" do
    user = Fabricate(:user)
    login_as(user)
    visit new_item_path
    expect(page.status_code).to be(404)
  end
end
