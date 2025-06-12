#!/bin/bash
# Simple script to serve Jekyll site locally

echo "Starting Jekyll server..."
echo "Site will be available at: http://localhost:4000/promptlab/"
echo "Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --livereload 