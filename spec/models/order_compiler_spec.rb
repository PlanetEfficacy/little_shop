require 'rails_helper'

RSpec.describe OrderCompiler, type: :model do

  it "can populate an item order" do
    current_user = Fabricate(:user)
    item = Fabricate(:item)
    cart_contents = {item.id.to_s => 1}
    order_compiler = OrderCompiler.new(cart_contents, current_user)

    expect(order_compiler.populated_item_order.first.item_id).to eq(item.id)
    #check for quantity
    expect(order_compiler.order.user_id).to eq(current_user.id)
  end

  it "can handle one order with multiple items and quantities" do
    current_user = Fabricate(:user)
    item1 = Fabricate(:item)
    item2 = Fabricate(:item)
    item3 = Fabricate(:item)
    cart_contents = {item1.id.to_s => 1, item2.id.to_s => 1, item3.id.to_s => 1}
    order_compiler = OrderCompiler.new(cart_contents, current_user)


    expect(order_compiler.populated_item_order.last).to be_instance_of(ItemOrder)
  end

end
