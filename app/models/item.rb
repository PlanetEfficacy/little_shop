class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items

  def dollars
    BigDecimal(price / 100.0, price.to_s.length + 2)
  end
end
