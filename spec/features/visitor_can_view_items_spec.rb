require 'rails_helper'

RSpec.feature "visitor visits homepage" do
  scenario "visitor can see all existing items" do
    3.times { Fabricate(:item) }
    visit items_path
    expect(page).to have_css(".item", count: 3)
  end

end
