class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :quantity
      t.references :order, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
    end
  end
end
