class ItemOrder < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def subtotal
    item.price * quantity
  end
end
