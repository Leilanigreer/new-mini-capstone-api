class AddStatusAndSeedFlagToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :status, :string, default: 'active'
    add_column :products, :is_seed_data, :boolean, default: false
    add_index :products, :status
  end
end
