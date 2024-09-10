class AddSupplierIdToProduct < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :supplier
  end
end
