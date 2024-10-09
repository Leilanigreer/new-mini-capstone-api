class CreateOrdersTable < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :subtotal, precision: 9, scale: 2
      t.decimal :tax, precision: 9, scale: 2
      t.decimal :total, precision: 9, scale: 2
      t.string :payment_method
      t.timestamps
    end
  end
end
