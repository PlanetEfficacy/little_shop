class Order < ActiveRecord::Base
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  def extracted_items
    cart_contents.keys.map do |key|
      key.to_i
    end
  end




end
