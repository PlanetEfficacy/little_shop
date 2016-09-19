require 'rails_helper'

RSpec.describe Cart, type: :model do
  attr_reader :cart

  before(:example) do
    @cart = Cart.new(nil)
  end

  let(:item) { Fabricate(:item) }
  let(:item_1) { Fabricate(:item) }
  let(:item_2) { Fabricate(:item) }

  it "is initialized without any contents" do

    expect(cart.contents.length).to eq(0)
  end

  it "can have items added to it" do
    cart.add_item(1)
    expect(cart.contents.length).to eq(1)
  end

  it 'can return an array of item objects' do
    cart.add_item(item.id)
    expect(cart.items.length).to eq(1)
    expect(cart.items.first).to eq(item)
  end

  it 'can return a total price of its items' do
    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.items.length).to eq(2)
    expect(cart.total_price).to eq(BigDecimal(item_1.price + item_2.price) / 100)
    expect(cart.total_price).to be_an_instance_of(BigDecimal)
  end

  it 'can have items removed from it' do
    cart.add_item(item.id)
    expect(cart.contents.length).to eq(1)
    cart.remove_item(item.id)
    expect(cart.contents.length).to eq(0)
  end

  it 'can return its own subtotal' do
    cart.add_item(item_1.id)
    cart.add_item(item_1.id)
    expect(cart.subtotal(item_1.id)).to eq(cart.price(item_1.id)*2)
  end

  it 'can return its total price' do
    cart.add_item(item_1.id)
    cart.add_item(item_2.id)
    cart.add_item(item_2.id)
    expect(cart.total_price).to eq(cart.subtotal(item_1.id) + cart.subtotal(item_2.id))
    expect(cart.total_price).to be_an_instance_of(BigDecimal)
  end

  it 'can change quantity of an item it contains' do
    cart.add_item(item_1.id)
    expect(cart.quantity(item_1.id)).to eq(1)
    cart.increase_quantity(item_1.id)
    expect(cart.quantity(item_1.id)).to eq(2)
    cart.decrease_quantity(item_1.id)
    expect(cart.quantity(item_1.id)).to eq(1)
  end

  it "knows if it has more than one item" do
    expect(cart.has_more_than_one(item_1.id)).to eq(false)
    cart.add_item(item_1.id)
    cart.add_item(item_1.id)
    expect(cart.has_more_than_one(item_1.id)).to eq(true)
  end
end
