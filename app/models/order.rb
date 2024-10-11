class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  before_create :set_totals

  def set_totals
    carted_products = CartedProduct.carted_items_for_user(user_id).includes(:product)
    self.subtotal = carted_products.sum { |cp| cp.product.price * cp.product_quantity }
    self.tax = subtotal * 0.09
    self.total = subtotal + tax
  end

  def ordered_date
    created_at.strftime("%m/%d/%Y")
  end

  def updated_date
    updated_at.strftime("%m/%d/%Y")
  end
end
