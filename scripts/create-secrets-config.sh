#!/bin/bash

# Script to create _config_secrets.yml from environment variables
# This script looks for all environment variables that start with APP_KEY_

echo "# Auto-generated from environment variables - DO NOT EDIT" > _config_secrets.yml
echo "# This file is created by scripts/create-secrets-config.sh" >> _config_secrets.yml
echo "" >> _config_secrets.yml

# Count found keys
key_count=0

# Look for all environment variables starting with APP_KEY_
for var in $(env | grep '^APP_KEY_' | sort); do
  # Split the variable into name and value
  key=$(echo "$var" | cut -d'=' -f1)
  value=$(echo "$var" | cut -d'=' -f2-)
  
  # Convert APP_KEY_A to app_key_a
  config_key=$(echo "$key" | tr '[:upper:]' '[:lower:]')
  
  # Add to config file
  echo "${config_key}: \"${value}\"" >> _config_secrets.yml
  
  echo "Added ${key} -> ${config_key}"
  ((key_count++))
done

if [ $key_count -eq 0 ]; then
  echo "# No APP_KEY_* environment variables found" >> _config_secrets.yml
  echo "Warning: No APP_KEY_* environment variables found"
else
  # Create auth_tokens variable with all tokens comma-separated
  echo "" >> _config_secrets.yml
  echo "# All authentication tokens in a single variable for dynamic access" >> _config_secrets.yml
  
  # Collect all token values
  auth_tokens=""
  separator=""
  for var in $(env | grep '^APP_KEY_' | sort); do
    value=$(echo "$var" | cut -d'=' -f2-)
    auth_tokens="${auth_tokens}${separator}${value}"
    separator=","
  done
  
  echo "auth_tokens: \"${auth_tokens}\"" >> _config_secrets.yml
  echo "Created _config_secrets.yml with ${key_count} APP_KEY_* variables"
fi 