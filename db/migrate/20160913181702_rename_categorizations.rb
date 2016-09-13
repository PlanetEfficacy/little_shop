class RenameCategorizations < ActiveRecord::Migration
  def change
    rename_table :categorizations, :category_items
  end
end
