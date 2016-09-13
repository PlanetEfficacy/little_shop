require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has many category_items" do
    should have_and_belong_to_many(:items)
  end
end
