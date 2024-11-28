namespace :products do
  desc "Reset seed products and archive old products"
  task reset: :environment do
    begin
      puts "Starting product reset..."

      # Load and execute seed SQL file
      seed_sql = File.read(Rails.root.join("db", "seed_products.sql"))
      ActiveRecord::Base.connection.execute(seed_sql)

      # Archive non-seed products older than 7 days
      Product.where(is_seed_data: false)
             .where("created_at < ?", 7.days.ago)
             .update_all(status: "archived")

      puts "Product reset completed!"
    ensure
      # Explicitly close connections to ensure clean exit
      ActiveRecord::Base.connection_pool.disconnect!
    end
  end
end
