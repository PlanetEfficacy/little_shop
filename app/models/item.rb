class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :item_orders
  has_many :orders, through: :item_orders
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  validates_numericality_of :price, greater_than: 0

  def dollars
    price
  end

  def retired?
    retired
  end

  def retire
    update_attribute(:retired, true)
  end
end
