class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders, through: :carted_products
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 1..500 }

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def images_with_default
    if images.length > 0
      images
    else
      [
        { id: 100000, url: "https://mscclaw.com/media/Image-Coming-Soon.png", created_at: Time.now, updated_at: Time.now }
      ]
    end
  end
end
