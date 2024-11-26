class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  def self.carted_items_for_user(user_id)
      where(user_id: user_id, status: "carted").includes(:product)
  end

  def self.grand_total_for_user_carted(user_id)
    carted_items_for_user(user_id).sum { |cp| cp.product.price * cp.product_quantity }
  end
end
