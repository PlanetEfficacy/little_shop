class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :item_orders
  has_many :orders, through: :item_orders
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  validates_numericality_of :price, greater_than: 0

  has_attached_file :image, styles: {
   thumb: '100x100>',
   square: '200x200#',
   medium: '300x300>'
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def dollars
    price
  end

  def retired?
    retired
  end

  def retire
    update_attribute(:retired, true)
  end

  def product_image
    if image_file_name
      image.url(:medium)
    else
      image_url
    end
  end
end
