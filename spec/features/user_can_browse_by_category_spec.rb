# Background: I have two categories with titles and each has two different items assigned
#
#   As a visitor
#   When I visit "/:CATEGORY_NAME"
#   I see all items assigned to that category
require 'rails_helper'

RSpec.feature "visitor can browse by category" do
  scenario "visitor can see existing items in a single category" do
    category_1 = Fabricate(:category)
    visit category_path(category_1)
    category_path = category_1.name.gsub(' ', '-').downcase
    expect(current_path).to eq "/#{category_path}"
    expect(page).to have_css(".item", count: 5)
    expect(page).to have_content("All items for #{category_1.name}:")
  end
end
