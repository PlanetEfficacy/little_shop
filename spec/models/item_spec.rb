require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has many category_items" do
    should have_and_belong_to_many(:categories)
  end
end
