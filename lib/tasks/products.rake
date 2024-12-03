namespace :products do
  desc "Reset seed products and archive old products"
  task reset: :environment do
    begin
      puts "Starting product reset..."

      # Get the database configuration from Rails
      # This is more reliable as it uses the same configuration your app uses
      db_config = ActiveRecord::Base.connection_config

      puts "\nDatabase connection details (filtered):"
      puts "Host: #{db_config[:host]}"
      puts "Port: #{db_config[:port]}"
      puts "Database: #{db_config[:database]}"
      puts "Username: #{db_config[:username]}"
      puts "Using password?: #{db_config[:password].present? ? 'Yes' : 'No'}"
      puts "\n"

      puts "Connecting to database #{db_config[:database]} on host #{db_config[:host]}"

      # Set up the environment for psql
      env = {
        "PGPASSWORD" => db_config[:password],
        "RAILS_ENV" => ENV["RAILS_ENV"] || "production"
      }

      # Construct the psql command
      cmd = [
        "psql",
        "-h", db_config[:host],
        "-p", db_config[:port].to_s,
        "-U", db_config[:username],
        "-d", db_config[:database],
        "-v", "ON_ERROR_STOP=1",
        "-a",  # Echo all input
        "-e",  # Echo commands
        "-f", Rails.root.join("db", "seed_products.sql").to_s
      ].join(" ")

      puts "Executing command: #{cmd.gsub(db_config[:password], '[FILTERED]')}"  # Log command but hide password
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
        puts "\nTrying to get more error information..."

        # Try to test database connection through Rails
        begin
          test_connection = ActiveRecord::Base.connection.execute("SELECT 1")
          puts "Rails database connection test: SUCCESS"
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
