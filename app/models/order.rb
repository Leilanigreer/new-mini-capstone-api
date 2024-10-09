class Order < ApplicationRecord
  belongs_to :carted_product
  belongs_to :user
  has_many :products, through: :carted_product

  def product_price
    product.price
  end

  def sub_total
    product_price * quantity.to_d
  end

  def order_tax
    sub_total * 0.09
  end

  def order_total
    sub_total + order_tax
  end
end
