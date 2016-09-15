require 'rails_helper'

RSpec.describe Order, type: :model do

  context "validations" do
    it { should belong_to(:user) }
    it { should have_many(:item_orders) }
    it { should have_many(:items) }
  end

  # it "has many categorizations" do
  #   should have_many(:category_items)
  # end
  #
  # it 'can return its price in dollars' do
  #   item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 500001, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
  #   expect(item.dollars).to eq(5000.01)
  #   expect(item.dollars).to be_an_instance_of(BigDecimal)
  # end
end
