class Order < ActiveRecord::Base
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  enum status: %w(ordered paid cancelled completed)
end
