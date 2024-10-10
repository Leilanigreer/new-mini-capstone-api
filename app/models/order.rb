class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  before_create :set_totals

  def set_totals
    carted_products = CartedProduct.carted_items_for_user(user_id)
    self.subtotal = carted_products.sum(&:total_carted_price)
    self.tax = subtotal * 0.09
    self.total = subtotal + tax
  end
end
