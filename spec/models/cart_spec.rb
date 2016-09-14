require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "is initialized without any contents" do
    cart = Cart.new(nil)
    expect(cart.contents.length).to eq(0)
  end

  it "can have items added to it" do
    cart = Cart.new(nil)
    cart.add_item(1)
    expect(cart.contents.length).to eq(1)
  end

  it 'can return an array of item objects' do
    cart = Cart.new(nil)
    item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    cart.add_item(item.id)
    expect(cart.items.length).to eq(1)
    expect(cart.items.first).to eq(item)
  end

  it 'can return a total price of its items' do
    cart = Cart.new(nil)
    item_1 = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    item_2 = Item.create(title: "Stapler", description: "This is an artisinal stapler!", price: 6000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.items.length).to eq(2)
    expect(cart.total_price).to eq(110.00)
    expect(cart.total_price).to be_an_instance_of(BigDecimal)
  end

  it 'can have items removed from it' do
    cart = Cart.new(nil)
    item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    cart.add_item(item.id)
    expect(cart.contents.length).to eq(1)
    cart.remove_item(item.id)
    expect(cart.contents.length).to eq(0)
  end

  it 'can return its own subtotal' do
    cart = Cart.new(nil)
    item1 = Fabricate(:item)
    cart.add_item(item1.id)
    cart.add_item(item1.id)
    expect(cart.subtotal(item1.id)).to eq(cart.price(item1.id)*2)
  end

  it 'can return its total price' do
    cart = Cart.new(nil)
    item1 = Fabricate(:item)
    item2 = Fabricate(:item)
    cart.add_item(item1.id)
    cart.add_item(item2.id)
    cart.add_item(item2.id)
    expect(cart.total_price).to eq(cart.subtotal(item1.id) + cart.subtotal(item2.id))
    expect(cart.total_price).to be_an_instance_of(BigDecimal)
  end

  it 'can cahnge quantity of an item it contains' do
    cart = Cart.new(nil)
    item1 = Fabricate(:item)
    cart.add_item(item1.id)
    expect(cart.quantity(item1.id)).to eq(1)
    cart.increase_quantity(item1.id)
    expect(cart.quantity(item1.id)).to eq(2)
    cart.decrease_quantity(item1.id)
    expect(cart.quantity(item1.id)).to eq(1)
  end





end
