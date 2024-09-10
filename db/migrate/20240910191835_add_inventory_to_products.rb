class AddInventoryToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :inventory, :integer
  end
end
