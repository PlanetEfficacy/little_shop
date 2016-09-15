require 'rails_helper'

RSpec.feature "retired items" do
  scenario "visitor visits item page and sees item retired message" do
    item = Fabricate(:item)
    item.retire

    # As a user if I visit an item page and that item has been retired
    visit item_path(item)
    # Then I should still be able to access the item page
    expect(current_path).to eq(item_path(item))
    # And I should not be able to add the item to their cart
    expect(page).not_to have_button("Add to Cart")
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
    within(:css, ".label-warning") do
      expect(page).to have_content("Item Retired")
    end
  end
end
