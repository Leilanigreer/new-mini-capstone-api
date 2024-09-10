class AddProductIdToImage < ActiveRecord::Migration[7.2]
  def change
    add_reference :images, :product
  end
end
