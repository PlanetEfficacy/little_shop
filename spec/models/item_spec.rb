require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should have_many(:orders) }
    it { should have_many(:item_orders) }
    it { should have_many(:categories) }
    it { should have_many(:category_items) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_presence_of(:categories) }
    it { should have_many(:reviews) }

  end

  it 'can return its price in dollars' do
    item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000.01, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    expect(item.dollars).to eq(5000.01)
    expect(item.dollars).to be_an_instance_of(BigDecimal)
  end

  it 'is not retired by default' do
    item = Fabricate(:item)
    expect(item.retired?).to eq(false)
  end

  it 'can be retired' do
    item = Fabricate(:item)
    item.retire
    expect(item.retired?).to eq(true)
  end

  it 'has a product_image that returns the image url if there is no file' do
    item = Fabricate(:item)
    expect(item.product_image).to eq(item.image_url)
  end

  it 'has a product_image that returns the file path if there is a file' do
    item = Fabricate(:item, image_file_name: Faker::File.file_name('path/to'))
    expect(item.product_image).to eq(item.image.url(:medium))
  end

  it "has an average rating" do
    item = Fabricate(:item)
    item.reviews.create(stars: 4)
    item.reviews.create(stars: 5)
    expect(item.reviews.count).to eq(2)
    expect(item.average_rating).to eq(4.5)
  end

end
