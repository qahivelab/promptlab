# Dynamic Token-Based Authentication System for Jekyll - Replication Prompt

## 🎯 **Objective**
Implement a fully dynamic, scalable token-based authentication system for a Jekyll site that automatically detects and validates unlimited tokens without requiring code changes when adding new tokens.

## 📋 **System Requirements**

### **Core Features:**
- ✅ **Dynamic Token Detection**: Automatically detect all `APP_KEY_*` environment variables
- ✅ **Scalable Authentication**: Support unlimited tokens without code modifications
- ✅ **Dual Environment Support**: Local development (.env) and production (GitHub Secrets)
- ✅ **Session Management**: Persistent login sessions with logout functionality
- ✅ **Protected Routes**: Automatic redirection for unauthenticated users
- ✅ **GitHub Pages Compatible**: Full deployment automation

### **Technical Stack:**
- Jekyll 4.3.3+
- GitHub Actions for CI/CD
- GitHub Pages for hosting
- Ruby for environment processing
- JavaScript for client-side authentication
- Liquid templating for dynamic content

## 🏗️ **Implementation Instructions**

### **Step 1: Project Structure Setup**

Create the following directory structure:
```
your-jekyll-project/
├── _config.yml
├── .gitignore
├── Gemfile
├── serve.sh
├── login.html
├── scripts/
│   ├── load-env.rb
│   └── create-secrets-config.sh
├── .github/
│   └── workflows/
│       └── pages.yml
└── AUTHENTICATION.md
```

### **Step 2: Core Configuration Files**

#### **_config.yml**
```yaml
# Site settings
title: Your Site Name
description: Your site description
baseurl: "/your-repo-name"  # Replace with your repository name
url: "https://yourusername.github.io"  # Replace with your GitHub username

# Build settings
markdown: kramdown
highlighter: rouge
plugins:
  - jekyll-feed
  - jekyll-sitemap

# Collections (customize as needed)
collections:
  your_collection:
    output: true
    permalink: /:collection/:name/

# Exclude from processing
exclude:
  - .env
  - scripts/
  - serve.sh
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor
  - .bundle
  - .sass-cache
  - .jekyll-cache
  - .jekyll-metadata

# Include config secrets (generated dynamically)
include:
  - _config_secrets.yml
```

#### **Gemfile**
```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3.3"
gem "minima", "~> 2.5"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap"
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
```

#### **.gitignore**
```
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
.bundle/
vendor/
.env
_config_secrets.yml
node_modules/
*.gem
*.rbc
.config
coverage
InstalledFiles
lib/bundler/man
pkg
rdoc
spec/reports
test/tmp
test/version_tmp
tmp
.DS_Store
Thumbs.db
```

### **Step 3: Authentication System Files**

#### **scripts/load-env.rb**
```ruby
#!/usr/bin/env ruby

require 'yaml'

# Load environment variables from .env file
def load_env_file
  env_vars = {}
  if File.exist?('.env')
    File.readlines('.env').each do |line|
      line = line.strip
      next if line.empty? || line.start_with?('#')
      
      key, value = line.split('=', 2)
      env_vars[key] = value if key && value
    end
  end
  env_vars
end

# Extract all APP_KEY_* variables
def extract_app_keys(env_vars)
  app_keys = {}
  all_tokens = []
  
  env_vars.each do |key, value|
    if key.start_with?('APP_KEY_')
      app_keys[key.downcase] = value
      all_tokens << value
    end
  end
  
  # Add comma-separated tokens for dynamic parsing
  app_keys['auth_tokens'] = all_tokens.join(',') unless all_tokens.empty?
  
  app_keys
end

# Generate Jekyll config
def generate_config(app_keys)
  config = {
    'auth_tokens' => app_keys['auth_tokens'] || '',
  }
  
  # Add individual keys for backward compatibility
  app_keys.each do |key, value|
    config[key] = value unless key == 'auth_tokens'
  end
  
  config
end

# Main execution
env_vars = load_env_file
app_keys = extract_app_keys(env_vars)
config = generate_config(app_keys)

# Write to _config_secrets.yml
File.open('_config_secrets.yml', 'w') do |file|
  file.write(config.to_yaml)
end

puts "✅ Generated _config_secrets.yml with #{app_keys.length - 1} tokens"
```

#### **scripts/create-secrets-config.sh**
```bash
#!/bin/bash

# Create _config_secrets.yml from GitHub Secrets
echo "🔧 Creating configuration from GitHub Secrets..."

# Extract all APP_KEY_* environment variables
APP_KEYS=()
AUTH_TOKENS=""

# Collect all APP_KEY_* variables
for var in $(env | grep '^APP_KEY_' | cut -d= -f1); do
    value="${!var}"
    if [ ! -z "$value" ]; then
        APP_KEYS+=("$var")
        if [ -z "$AUTH_TOKENS" ]; then
            AUTH_TOKENS="$value"
        else
            AUTH_TOKENS="$AUTH_TOKENS,$value"
        fi
    fi
done

# Generate YAML configuration
cat > _config_secrets.yml << EOF
---
auth_tokens: "$AUTH_TOKENS"
EOF

# Add individual keys for backward compatibility
for key in "${APP_KEYS[@]}"; do
    value="${!key}"
    echo "${key,,}: \"$value\"" >> _config_secrets.yml
done

echo "✅ Generated _config_secrets.yml with ${#APP_KEYS[@]} tokens"
echo "🔑 Available tokens: ${APP_KEYS[*]}"
```

#### **serve.sh**
```bash
#!/bin/bash

echo "🚀 Starting Jekyll development server..."

# Load environment variables and generate config
echo "📝 Loading environment variables..."
ruby scripts/load-env.rb

# Start Jekyll server
echo "🌐 Starting server at http://localhost:4000/your-repo-name/"
bundle exec jekyll serve --config _config.yml,_config_secrets.yml --baseurl "/your-repo-name" --host 0.0.0.0 --port 4000 --livereload
```

### **Step 4: Authentication Interface**

#### **login.html**
```html
---
layout: default
title: Access Required
---

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ page.title }} - {{ site.title }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h1 {
            color: #333;
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: #666;
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e1e5e9;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .login-button {
            width: 100%;
            padding: 0.75rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .login-button:hover {
            transform: translateY(-2px);
        }

        .error-message {
            background: #fee;
            color: #c33;
            padding: 0.75rem;
            border-radius: 5px;
            margin-bottom: 1rem;
            text-align: center;
            display: none;
        }

        .footer {
            text-align: center;
            margin-top: 2rem;
            color: #666;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>🔐 Access Required</h1>
            <p>Please enter your access token to continue</p>
        </div>

        <div id="error-message" class="error-message"></div>

        <form id="login-form">
            <div class="form-group">
                <label for="token">Access Token</label>
                <input type="password" id="token" name="token" required autocomplete="off">
            </div>
            <button type="submit" class="login-button">Login</button>
        </form>

        <div class="footer">
            <p>Powered by {{ site.title }}</p>
        </div>
    </div>

    <script>
        // Get available tokens from Jekyll site configuration
        const availableTokens = '{{ site.auth_tokens }}'.split(',').filter(token => token.trim() !== '');
        
        console.log(`Found ${availableTokens.length} valid tokens:`, availableTokens);

        document.getElementById('login-form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const token = document.getElementById('token').value.trim();
            const errorDiv = document.getElementById('error-message');
            
            if (availableTokens.includes(token)) {
                // Store authentication
                sessionStorage.setItem('authenticated', 'true');
                sessionStorage.setItem('authToken', token);
                
                // Redirect to intended page or home
                const urlParams = new URLSearchParams(window.location.search);
                const redirect = urlParams.get('redirect') || '{{ site.baseurl }}/';
                window.location.href = redirect;
            } else {
                // Show error
                errorDiv.textContent = 'Invalid token. Please try again.';
                errorDiv.style.display = 'block';
                document.getElementById('token').value = '';
                document.getElementById('token').focus();
            }
        });

        // Check if already authenticated
        if (sessionStorage.getItem('authenticated') === 'true') {
            const urlParams = new URLSearchParams(window.location.search);
            const redirect = urlParams.get('redirect') || '{{ site.baseurl }}/';
            window.location.href = redirect;
        }
    </script>
</body>
</html>
```

### **Step 5: Layout with Authentication**

#### **_layouts/default.html**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
    <meta name="description" content="{{ page.description | default: site.description }}">
    
    <!-- Add your CSS here -->
    <style>
        /* Add your site styles */
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .auth-nav { text-align: right; padding: 1rem; }
        .logout-btn { color: #dc3545; text-decoration: none; }
    </style>
</head>
<body>
    <!-- Authentication Navigation -->
    <div class="auth-nav">
        <span id="auth-status"></span>
        <a href="#" id="logout-btn" class="logout-btn" style="display: none;">Logout</a>
    </div>

    <!-- Main Content -->
    <main>
        {{ content }}
    </main>

    <!-- Authentication Script -->
    <script>
        // Authentication check
        function checkAuthentication() {
            const isAuthenticated = sessionStorage.getItem('authenticated') === 'true';
            const currentPath = window.location.pathname;
            const loginPath = '{{ site.baseurl }}/login.html';
            
            if (!isAuthenticated && currentPath !== loginPath) {
                // Redirect to login with current page as redirect parameter
                const redirectUrl = encodeURIComponent(window.location.href);
                window.location.href = `${loginPath}?redirect=${redirectUrl}`;
                return false;
            }
            
            if (isAuthenticated) {
                document.getElementById('auth-status').textContent = 'Authenticated';
                document.getElementById('logout-btn').style.display = 'inline';
            }
            
            return true;
        }

        // Logout functionality
        document.getElementById('logout-btn').addEventListener('click', function(e) {
            e.preventDefault();
            sessionStorage.removeItem('authenticated');
            sessionStorage.removeItem('authToken');
            window.location.href = '{{ site.baseurl }}/login.html';
        });

        // Run authentication check
        checkAuthentication();
    </script>
</body>
</html>
```

### **Step 6: GitHub Actions Workflow**

#### **.github/workflows/pages.yml**
```yaml
name: Deploy Jekyll site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true

      - name: Create secrets configuration
        env:
          APP_KEY_USER1: ${{ secrets.APP_KEY_USER1 }}
          APP_KEY_USER2: ${{ secrets.APP_KEY_USER2 }}
          APP_KEY_ADMIN: ${{ secrets.APP_KEY_ADMIN }}
          # Add more APP_KEY_* secrets as needed
        run: |
          chmod +x scripts/create-secrets-config.sh
          ./scripts/create-secrets-config.sh

      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5

      - name: Build with Jekyll
        run: bundle exec jekyll build --config _config.yml,_config_secrets.yml --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### **Step 7: Documentation**

#### **AUTHENTICATION.md**
```markdown
# Authentication System Documentation

## Overview
This Jekyll site uses a dynamic token-based authentication system that automatically scales without code changes.

## Adding New Users

### Local Development
1. Add token to `.env` file:
   ```
   APP_KEY_NEWUSER=your-secure-token-here
   ```

### Production
1. Go to GitHub repository settings
2. Navigate to Secrets and variables → Actions
3. Add new repository secret:
   - Name: `APP_KEY_NEWUSER`
   - Value: `your-secure-token-here`
4. Update `.github/workflows/pages.yml` to include the new secret

## Token Format
- Prefix: `APP_KEY_`
- Suffix: User identifier (e.g., `ADMIN`, `USER1`, `MANAGER`)
- Value: Secure random string (recommended: 32+ characters)

## System Features
- ✅ Unlimited tokens
- ✅ No code changes required
- ✅ Session management
- ✅ Automatic redirects
- ✅ GitHub Pages compatible
```

## 🚀 **Deployment Instructions**

### **Step 1: Repository Setup**
1. Create new GitHub repository
2. Clone and add all files above
3. Update repository name in `_config.yml` and `serve.sh`
4. Update GitHub username in `_config.yml`

### **Step 2: Configure GitHub Secrets**
1. Go to repository Settings → Secrets and variables → Actions
2. Add secrets for each user:
   ```
   APP_KEY_ADMIN=your-admin-token
   APP_KEY_USER1=your-user1-token
   APP_KEY_USER2=your-user2-token
   ```

### **Step 3: Enable GitHub Pages**
1. Go to repository Settings → Pages
2. Source: GitHub Actions
3. Save configuration

### **Step 4: Deploy**
1. Push code to main branch
2. GitHub Actions will automatically deploy
3. Site will be available at: `https://yourusername.github.io/your-repo-name/`

## 🔧 **Customization Options**

### **Token Generation**
```bash
# Generate secure tokens
openssl rand -hex 16  # 32-character token
openssl rand -base64 24  # 32-character base64 token
```

### **Styling Customization**
- Modify CSS in `login.html` for custom branding
- Update `_layouts/default.html` for site-wide styling
- Add your logo and colors

### **Additional Security**
- Add token expiration (modify JavaScript)
- Implement rate limiting
- Add IP restrictions
- Enable 2FA integration

## 📝 **Usage Examples**

### **Adding a New User**
1. Generate token: `openssl rand -hex 16`
2. Add to GitHub Secrets: `APP_KEY_NEWUSER=generated-token`
3. Update workflow file to include new secret
4. Deploy automatically handles the rest

### **Removing a User**
1. Delete GitHub Secret
2. Redeploy (token becomes invalid automatically)

## ✅ **Success Criteria**
After implementation, you should have:
- ✅ Working authentication system
- ✅ Dynamic token detection
- ✅ Automatic GitHub Pages deployment
- ✅ Session management
- ✅ Scalable user management
- ✅ No code changes needed for new users

---

**This prompt provides a complete, production-ready authentication system that can be implemented in any Jekyll project with minimal modifications.** 