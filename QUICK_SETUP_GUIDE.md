# Quick Setup Guide - Dynamic Jekyll Authentication

## 🚀 **5-Minute Setup**

### **1. Copy Core Files**
```bash
# Create project structure
mkdir my-secure-jekyll-site
cd my-secure-jekyll-site

# Copy these files from REPLICATION_PROMPT.md:
# - _config.yml
# - Gemfile  
# - .gitignore
# - login.html
# - scripts/load-env.rb
# - scripts/create-secrets-config.sh
# - serve.sh
# - .github/workflows/pages.yml
# - _layouts/default.html
```

### **2. Customize Configuration**
```yaml
# Update _config.yml
title: "My Secure Site"
baseurl: "/my-repo-name"  # Your GitHub repo name
url: "https://yourusername.github.io"  # Your GitHub username
```

### **3. Generate Tokens**
```bash
# Generate secure tokens
openssl rand -hex 16  # For each user
```

### **4. Local Development**
```bash
# Create .env file
echo "APP_KEY_ADMIN=your-admin-token-here" > .env
echo "APP_KEY_USER1=your-user1-token-here" >> .env

# Install dependencies
bundle install

# Start development server
chmod +x serve.sh
./serve.sh
```

### **5. Deploy to GitHub**
```bash
# Initialize git and push
git init
git add .
git commit -m "Initial commit with authentication"
git remote add origin https://github.com/yourusername/my-repo-name.git
git push -u origin main
```

### **6. Configure GitHub Secrets**
1. Go to: `https://github.com/yourusername/my-repo-name/settings/secrets/actions`
2. Add secrets:
   - `APP_KEY_ADMIN` = `your-admin-token-here`
   - `APP_KEY_USER1` = `your-user1-token-here`

### **7. Enable GitHub Pages**
1. Go to: `https://github.com/yourusername/my-repo-name/settings/pages`
2. Source: **GitHub Actions**
3. Save

## ✅ **Verification**
- Site deploys automatically
- Login page appears at: `https://yourusername.github.io/my-repo-name/`
- Tokens work for authentication
- Protected pages redirect to login

## 🔧 **Adding New Users**
```bash
# 1. Generate token
openssl rand -hex 16

# 2. Add GitHub Secret
# Name: APP_KEY_NEWUSER
# Value: generated-token

# 3. Update workflow file to include new secret
# 4. Push changes - automatic deployment
```

## 📱 **Test Commands**
```bash
# Local testing
./serve.sh

# Token generation
openssl rand -hex 16

# Check deployment
curl -I https://yourusername.github.io/my-repo-name/
```

---

**Total setup time: ~5 minutes + GitHub deployment time (~2 minutes)** 