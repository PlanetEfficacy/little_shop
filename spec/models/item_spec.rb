require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has many category_items" do
    should have_many(:categories)
  end

  it "has many categorizations" do
    should have_many(:categorizations)
  end
end
