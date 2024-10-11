class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  # def self.carted_items_for_user(user_id)
  #   select("carted_products.*,
  #     products.price as product_price,
  #     (carted_products.product_quantity * products.price) as total_carted_price")
  #     .joins(:product)
  #     .where(user_id: user_id, status: "carted")
  # end

  def self.carted_items_for_user(user_id)
      where(user_id: user_id, status: "carted").includes(:product)
  end

  # def self.carted_items_total
  #   carted_items_for_user(user_id)

  def self.grand_total_for_user_carted(user_id)
    carted_items_for_user(user_id).sum { |cp| cp.product.price * cp.product_quantity }
  end
end
