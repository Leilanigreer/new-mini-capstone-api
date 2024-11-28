# lib/tasks/products.rake
namespace :products do
  desc "Reset products to seed state and archive old products"
  task reset: :environment do
    Product.reset_products
  end

  desc "Create seed data backup"
  task backup_seeds: :environment do
    db_config = Rails.configuration.database_url || Rails.configuration.database_configuration[Rails.env]
    system("pg_dump --data-only --table=products --table=images --table=category_products --where=\"products.is_seed_data = true\" #{db_config['database']} > #{Rails.root.join('db', 'seed_products.sql')}")
  end
end
