class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

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
