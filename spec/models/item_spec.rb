require 'rails_helper'

RSpec.describe Item, type: :model do
  # it "has many category_items" do
  #   should have_many(:categories)
  # end
  #
  # it "has many categorizations" do
  #   should have_many(:category_items)
  # end
  #
  # it "has many item orders" do
  #   should have_many(:item_orders)
  # end
  #
  # it "has many orders" do
  #   should have_many(:orders)
  # end

  context "validations" do
    it { should have_many(:orders) }
    it { should have_many(:item_orders) }
    it { should have_many(:categories) }
    it { should have_many(:category_items) }
  end

  it 'can return its price in dollars' do
    item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 500001, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    expect(item.dollars).to eq(5000.01)
    expect(item.dollars).to be_an_instance_of(BigDecimal)
  end
end
