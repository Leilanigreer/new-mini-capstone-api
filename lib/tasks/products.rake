namespace :products do
  desc "Reset seed products and archive old products"
  task reset: :environment do
    begin
      puts "Starting product reset..."

      # Construct the internal database URL for Railway
      # Using environment variables that Railway provides
      db_config = {
        user: ENV["PGUSER"],
        password: ENV["POSTGRES_PASSWORD"],
        host: ENV["RAILWAY_PRIVATE_DOMAIN"],
        port: "5432",  # Railway's internal port is always 5432
        database: ENV["PGDATABASE"]
      }

      # We'll add detailed logging to help with troubleshooting
      puts "Connecting to database #{db_config[:database]} on host #{db_config[:host]}"

      # Set up the environment for psql
      # We only need to set PGPASSWORD as other credentials will be passed via command line
      env = {
        "PGPASSWORD" => db_config[:password],
        "RAILS_ENV" => ENV["RAILS_ENV"] || "production"
      }

      # Construct the psql command with careful attention to security and error handling
      cmd = [
        "psql",
        "-h", db_config[:host],
        "-p", db_config[:port],
        "-U", db_config[:user],
        "-d", db_config[:database],
        "-v", "ON_ERROR_STOP=1",     # Stop on first error
        "-a",                        # Echo all input from the script
        "-e",                        # Echo commands sent to server
        "-f", Rails.root.join("db", "seed_products.sql").to_s
      ].join(" ")

      puts "Executing seed SQL file..."
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
        # Capture detailed error information
        error_message = "Failed to execute SQL file. Exit status: #{$?.exitstatus}"
        puts error_message

        # Try to get more detailed error information if possible
        puts "Last few lines of psql output (if available):"
        system("tail -n 5 #{Rails.root.join('log', 'production.log')}")

        raise error_message
      end

    rescue => e
      error_message = "Error during product reset: #{e.message}"
      Rails.logger.error(error_message)
      Rails.logger.error(e.backtrace.join("\n"))
      raise e
    ensure
      # Clean up database connections
      ActiveRecord::Base.connection_pool.disconnect!
    end
  end
end
