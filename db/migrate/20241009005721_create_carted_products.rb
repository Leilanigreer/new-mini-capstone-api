class CreateCartedProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :carted_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :product_quantity
      t.string :status
      t.integer :order_id
      t.decimal :purchased_price, precision: 9, scale: 2
      t.timestamps
    end
  end
end
