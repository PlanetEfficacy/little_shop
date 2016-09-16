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
  # it 'can accept cart contents' do
  #   item = Fabricate(:item)
  #   cart_contents = {item.id.to_s => 1}
  #   order = Order.new(cart_contents)
  #   expect(order.contents).to eq(item)
  # end
end
