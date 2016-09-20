class UpdateColumnTotalInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :total, :decimal, precision: 15, scale: 2
  end
end
