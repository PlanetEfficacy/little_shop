class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :items, :categories, table_name: :categorizations
  end
end
