namespace :products do
  desc "Reset seed products and archive old products"
  task reset: :environment do
    begin
      puts "Starting product reset..."

      # Get the database configuration using the Rails 7+ method
      db_config = ActiveRecord::Base.connection_db_config.configuration_hash

      puts "\nDatabase connection details (filtered):"
      puts "Host: #{db_config[:host]}"
      puts "Port: #{db_config[:port]}"
      puts "Database: #{db_config[:database]}"
      puts "Username: #{db_config[:username]}"
      puts "Using password?: #{db_config[:password].present? ? 'Yes' : 'No'}"
      puts "\n"

      # First, let's create a temporary SQL file that includes the cleanup commands
      temp_sql_path = Rails.root.join("tmp", "temp_seed.sql")
      File.open(temp_sql_path, "w") do |temp_file|
        # Add cleanup commands
        temp_file.puts "BEGIN;"
        temp_file.puts "-- Disable triggers temporarily to avoid foreign key conflicts"
        temp_file.puts "ALTER TABLE suppliers DISABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE categories DISABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE products DISABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE images DISABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE category_products DISABLE TRIGGER ALL;"

        # Clear existing data
        temp_file.puts "TRUNCATE suppliers, categories, products, images, category_products RESTART IDENTITY CASCADE;"

        # Add the original seed data
        temp_file.puts File.read(Rails.root.join("db", "seed_products.sql"))

        # Re-enable triggers
        temp_file.puts "ALTER TABLE suppliers ENABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE categories ENABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE products ENABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE images ENABLE TRIGGER ALL;"
        temp_file.puts "ALTER TABLE category_products ENABLE TRIGGER ALL;"
        temp_file.puts "COMMIT;"
      end

      # Set up the environment for psql
      env = {
        "PGPASSWORD" => db_config[:password],
        "RAILS_ENV" => ENV["RAILS_ENV"] || "production"
      }

      # Execute the temporary SQL file
      cmd = [
        "psql",
        "-h", db_config[:host],
        "-p", db_config[:port].to_s,
        "-U", db_config[:username],
        "-d", db_config[:database],
        "-v", "ON_ERROR_STOP=1",
        "-a",
        "-e",
        "-f", temp_sql_path.to_s
      ].join(" ")

      puts "Executing SQL reset and seed commands..."
      result = system(env, cmd)

      if result
        puts "SQL file executed successfully"

        puts "Archiving old products..."
        archived_count = Product.where(is_seed_data: false)
                              .where("created_at < ?", 7.days.ago)
                              .update_all(status: "archived")

        puts "Archived #{archived_count} old products"
        puts "Product reset completed successfully!"
      else
        error_message = "Failed to execute SQL file. Exit status: #{$?.exitstatus}"
        puts error_message
        raise error_message
      end

    rescue => e
      error_message = "Error during product reset: #{e.message}"
      puts error_message
      puts e.backtrace
      raise e
    ensure
      # Clean up the temporary file
      File.delete(temp_sql_path) if defined?(temp_sql_path) && File.exist?(temp_sql_path)
      ActiveRecord::Base.connection_pool.disconnect!
    end
  end
end
