class DropOrdersTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :orders
  end
end
