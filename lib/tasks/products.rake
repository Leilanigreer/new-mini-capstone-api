namespace :products do
  desc "Reset seed products and archive old products"
  task reset: :environment do
    begin
      puts "Starting product reset..."

      # Get the database configuration using the new Rails 7+ method
      db_config = ActiveRecord::Base.connection_db_config.configuration_hash

      # Debug statements to verify our connection details
      puts "\nDatabase connection details (filtered):"
      puts "Host: #{db_config[:host]}"
      puts "Port: #{db_config[:port]}"
      puts "Database: #{db_config[:database]}"
      puts "Username: #{db_config[:username]}"
      puts "Using password?: #{db_config[:password].present? ? 'Yes' : 'No'}"
      puts "\n"

      # Set up the environment for psql with the proper credentials
      env = {
        "PGPASSWORD" => db_config[:password],
        "RAILS_ENV" => ENV["RAILS_ENV"] || "production"
      }

      # Construct the psql command with all necessary options
      cmd = [
        "psql",
        "-h", db_config[:host],
        "-p", db_config[:port].to_s,
        "-U", db_config[:username],
        "-d", db_config[:database],
        "-v", "ON_ERROR_STOP=1",  # Ensures psql stops on first error
        "-a",                     # Echo all input from the script
        "-e",                     # Echo commands sent to server
        "-f", Rails.root.join("db", "seed_products.sql").to_s
      ].join(" ")

      # Log the command (but hide sensitive information)
      puts "Executing command: #{cmd.gsub(db_config[:password].to_s, '[FILTERED]')}"

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

        # Additional error debugging
        puts "\nTrying to verify database connection..."
        begin
          test_result = ActiveRecord::Base.connection.execute("SELECT 1")
          puts "Rails database connection test: SUCCESS"
          puts "Test query result: #{test_result.inspect}"
        rescue => e
          puts "Rails database connection test: FAILED"
          puts "Error: #{e.message}"
        end

        raise error_message
      end

    rescue => e
      error_message = "Error during product reset: #{e.message}"
      puts error_message
      puts e.backtrace
      raise e
    ensure
      ActiveRecord::Base.connection_pool.disconnect!
    end
  end
end
