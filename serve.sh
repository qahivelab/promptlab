#!/bin/bash
# Simple script to serve Jekyll site locally

echo "Loading environment variables..."
ruby scripts/load-env.rb

echo "Starting Jekyll server..."
echo "Site will be available at: http://localhost:4000/promptlab/"
echo "Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --livereload --config _config.yml,_config_secrets.yml 