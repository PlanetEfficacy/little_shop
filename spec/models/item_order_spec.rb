require 'rails_helper'

RSpec.describe ItemOrder, type: :model do

  context "validations" do
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end

  it "has a subtotal" do
    item_order = Fabricate(:item_order)
    expected_subtotal = item_order.item.dollars * item_order.quantity
    expect(item_order.subtotal).to eq(expected_subtotal)
  end

end
