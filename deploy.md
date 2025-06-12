# GitHub Pages Deployment Guide

## Quick Deployment Steps

### 1. Push to GitHub
```bash
git init
git add .
git commit -m "Initial commit: PromptLab"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/promptlab.git
git push -u origin main
```

### 2. Enable GitHub Pages
1. Go to your repository on GitHub
2. Click on **Settings** tab
3. Scroll down to **Pages** section
4. Under **Source**, select "Deploy from a branch"
5. Choose **main** branch and **/ (root)** folder
6. Click **Save**

### 3. Configure Repository Settings (Optional)
- Update `_config.yml` with your actual GitHub username
- Update the repository URL in `_config.yml`
- Add your custom domain if you have one

### 4. Automatic Deployment
The repository includes a GitHub Actions workflow (`.github/workflows/pages.yml`) that will automatically:
- Build the Jekyll site
- Deploy to GitHub Pages
- Update the site whenever you push to the main branch

## Local Development

### Start the server:
```bash
bundle exec jekyll serve
```

### Access the site:
- Local: http://localhost:4000
- GitHub Pages: https://YOUR_USERNAME.github.io/promptlab

## Adding Content

### Add a new prompt:
1. Create a file in `_prompts/` directory
2. Use the template from `contributing.md`
3. Commit and push to GitHub

### Add a new guide:
1. Create a file in `_guides/` directory
2. Follow the guide template format
3. Commit and push to GitHub

## Troubleshooting

### Common Issues:
- **Build fails**: Check the Actions tab for error details
- **Site not updating**: Wait 5-10 minutes for GitHub Pages to rebuild
- **Missing content**: Ensure front matter is correctly formatted

### Local Testing:
Always test locally before pushing:
```bash
bundle exec jekyll build
bundle exec jekyll serve
``` 