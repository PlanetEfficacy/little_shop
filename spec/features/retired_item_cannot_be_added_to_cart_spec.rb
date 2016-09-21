require 'rails_helper'

RSpec.feature "retired items" do
  scenario "visitor visits item page and sees item retired message" do
    item = Fabricate(:item)
    item.retire

    visit item_path(item)
    expect(current_path).to eq(item_path(item))
    expect(page).not_to have_button("Add to Cart")
    within(:css, ".label-warning") do
      expect(page).to have_content("Item Retired")
    end
  end
end
