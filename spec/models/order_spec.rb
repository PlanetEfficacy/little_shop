require 'rails_helper'

RSpec.describe Order, type: :model do

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:item_orders) }
    it { should have_many(:items)}
  end

#how do we test model validations when an instance of that model is initialized with an argument (meaning, we're passing something in when we initialize)


  # it "has many categorizations" do
  #   should have_many(:category_items)
  # end
  #

  # it 'can identify in the items table' do
  #   item1 = Fabricate(:item)
  #   item2 = Fabricate(:item)
  #
  #   #clicking checkout instantiates instance of Order which can now hold cart_contents
  #   items_collection = Item.find([item1.id, item2.id]  #logged in user, add items, view, want to see name and item, unit price, quantity
  #   expect()
  # end
  it 'can get keys from cart contents' do
    user = Fabricate(:user)
    cart_contents = {"1" => 3, "2" => 1}
    order = Order.new
    binding.pry

    # item1 = Fabricate(:item)
    # item2 = Fabricate(:item)
    expect(order.extracted_items).to eq([1, 2])
  end

  it 'can accept cart contents' do
    item = Fabricate(:item)
    cart_contents = {item.id.to_s => 1}
    order = Order.new(cart_contents)
    expect(order.contents).to eq(item)
  end


end
