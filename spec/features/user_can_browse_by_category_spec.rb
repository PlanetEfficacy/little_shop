# Background: I have two categories with titles and each has two different items assigned
#
#   As a visitor
#   When I visit "/:CATEGORY_NAME"
#   I see all items assigned to that category
require 'rails_helper'

RSpec.feature "visitor can browse by category" do
  scenario "visitor can see existing items in a single category" do
    category = Category.create(name: "Fancy")
    item_1 = Fabricate(:item, categories: [category])
    item_2 = Fabricate(:item, categories: [category])
    # category_1 = Fabricate(:category)
    # category_1 = item_1.categories.first
    visit category_path(category)
    category_path = category.name.gsub(' ', '-').downcase
    expect(current_path).to eq "/#{category_path}"
    expect(page).to have_css(".item", count: 2)
    expect(page).to have_content("All items for #{category.name}:")
  end
end
