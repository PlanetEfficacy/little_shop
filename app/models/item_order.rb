class ItemOrder < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def subtotal
    item.dollars * quantity
  end

end
