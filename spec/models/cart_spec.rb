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
end
