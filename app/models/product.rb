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

  enum status: { active: "active", archived: "archived" }

  scope :active, -> { where(status: "active") }
  scope :for_display, -> { active.order(created_at: :desc) }


  def self.reset_products
    connection.transaction do
      # Archive old non-seed products
      where(is_seed_data: false)
        .where("created_at < ?", 7.days.ago)
        .update_all(status: "archived")

      # Reset seed products from SQL file
      seed_sql = File.read(Rails.root.join("db", "seed_products.sql"))

      # Clear existing seed data
      where(is_seed_data: true).destroy_all

      # Restore from backup
      connection.execute(seed_sql)

      # Ensure all seed products are active
      where(is_seed_data: true).update_all(status: "active")
    end
  end

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
