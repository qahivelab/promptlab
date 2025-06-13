#!/usr/bin/env ruby

require 'fileutils'

# Create scripts directory if it doesn't exist
FileUtils.mkdir_p(File.dirname(__FILE__))

env_file = '.env'
secrets_file = '_config_secrets.yml'

if File.exist?(env_file)
  puts "Loading environment variables from #{env_file}..."
  
  # Read .env file and parse variables
  env_vars = {}
  File.readlines(env_file).each do |line|
    line = line.strip
    next if line.empty? || line.start_with?('#')
    
    if line.include?('=')
      key, value = line.split('=', 2)
      env_vars[key.strip] = value.strip
    end
  end
  
  # Create _config_secrets.yml
  File.open(secrets_file, 'w') do |file|
    file.puts "# Auto-generated from .env file - DO NOT EDIT"
    file.puts "# This file is created by scripts/load-env.rb"
    file.puts ""
    
    # Find all APP_KEY_* variables and convert to Jekyll config keys
    app_keys = env_vars.keys.select { |key| key.start_with?('APP_KEY_') }.sort
    
    if app_keys.empty?
      file.puts "# No APP_KEY_* variables found"
    else
      app_keys.each do |env_key|
        # Convert APP_KEY_A to app_key_a, APP_KEY_B to app_key_b, etc.
        config_key = env_key.downcase
        file.puts "#{config_key}: \"#{env_vars[env_key]}\""
      end
      
      # Create a single auth_tokens variable with all tokens comma-separated
      auth_tokens = app_keys.map { |key| env_vars[key] }.join(',')
      file.puts ""
      file.puts "# All authentication tokens in a single variable for dynamic access"
      file.puts "auth_tokens: \"#{auth_tokens}\""
    end
    
    puts "Found #{app_keys.length} APP_KEY_* variables: #{app_keys.join(', ')}"
  end
  
  puts "Created #{secrets_file} with environment variables"
else
  puts "Warning: #{env_file} not found"
  
  # Create empty secrets file
  File.open(secrets_file, 'w') do |file|
    file.puts "# No .env file found - no APP_KEY_* variables available"
    file.puts "# Add APP_KEY_* variables to .env file to enable authentication"
  end
end 