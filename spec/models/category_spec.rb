require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has many category_items" do
    should have_many(:items)
  end

  it "has many categorizations" do
    should have_many(:categorizations)
  end
end
