class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products


  # The below is the same as the two has many above.
  # def products
  #   products = []
  #   category_products = CategoryProduct.where(product_id: id)
  #   category_products.each do |cp|
  #     products << Product.find_by(id: cp.product_id)
  #   end
  #   products
  # end
end
