# PromptLab

An experimental lab for prompt engineering techniques, templates, and best practices. Test, refine, and discover powerful prompts for AI tools. Built for developers, creatives, and researchers. Contributions welcome!

## 🚀 Quick Start

### Local Development

1. **Prerequisites**
   - Ruby (version 2.5.0 or higher)
   - RubyGems
   - Git

2. **Installation**
   ```bash
   # Clone the repository
   git clone https://github.com/your-username/promptlab.git
   cd promptlab

   # Install dependencies
   bundle install

   # Start the development server
   bundle exec jekyll serve
   ```

3. **View the Site**
   - Open your browser and navigate to `http://localhost:4000`

### GitHub Pages Deployment

This repository is configured for automatic deployment to GitHub Pages:

1. Fork this repository
2. Go to Settings → Pages
3. Select "Deploy from a branch"
4. Choose "main" branch and "/ (root)" folder
5. Your site will be available at `https://your-username.github.io/promptlab`

## 📁 Project Structure

```
.
├── _config.yml          # Jekyll configuration
├── _prompts/            # Prompt collection
├── _guides/             # Educational guides
├── _tools/              # Tool-specific information
├── _layouts/            # Custom page layouts
├── _includes/           # Reusable components
├── assets/              # CSS, JS, and images
├── index.md             # Homepage
├── contributing.md      # Contribution guidelines
└── README.md           # This file
```

## 🎯 What's Included

### Featured Content

- **UI Automation Template** - Comprehensive Playwright automation with Cursor
- **QA Automation Engineer Template** - Structured approach to test development
- **Incremental Development Guide** - Phase-based development methodology
- **Prompting Fundamentals** - Essential principles and techniques

### Collections

- **Prompts** (`_prompts/`) - Reusable prompt templates with metadata
- **Guides** (`_guides/`) - Educational content and best practices
- **Tools** (`_tools/`) - Platform-specific information and tips

### Features

- 🔍 **Searchable Content** - Find prompts by tags and categories
- 📋 **Copy-to-Clipboard** - Easy prompt copying with one click
- 📱 **Responsive Design** - Works on desktop and mobile
- 🌙 **Dark Mode Support** - Automatic dark mode detection
- 🏷️ **Tag System** - Organized by tools, use cases, and complexity
- 📊 **Metadata Rich** - Detailed information for each prompt

## 🤝 Contributing

We welcome contributions! Here are some ways you can help:

### Quick Contributions
- **Add a Prompt**: Share your effective prompts
- **Improve Documentation**: Make guides clearer
- **Report Issues**: Found something broken? Let us know
- **Suggest Features**: Ideas for improvements

### How to Contribute

1. **Fork the Repository**
2. **Create a Branch**: `git checkout -b feature/your-feature-name`
3. **Add Your Content**: Follow our [Contributing Guide](contributing.md)
4. **Submit a Pull Request**: Describe your changes

### Content Guidelines

#### Adding a Prompt
Create a file in `_prompts/` with this structure:

```yaml
---
title: "Your Prompt Title"
description: "Brief description"
tool: "Tool Name"
use_case: "Use Case"
complexity: "Beginner/Intermediate/Advanced"
tags:
  - tag1
  - tag2
date: YYYY-MM-DD
prompt: |
  Your prompt content here
---

Additional explanation and usage instructions.
```

#### Adding a Guide
Create a file in `_guides/` with this structure:

```yaml
---
title: "Guide Title"
description: "What this guide covers"
difficulty: "Beginner/Intermediate/Advanced"
reading_time: 5
tags:
  - guide-tag
date: YYYY-MM-DD
---

Your guide content in Markdown.
```

## 🛠️ Customization

### Themes and Styling
- Base theme: Minima
- Custom styles: `assets/css/style.scss`
- Layouts: `_layouts/`
- Includes: `_includes/`

### Configuration
- Site settings: `_config.yml`
- Navigation: Automatically generated from pages
- Collections: Configured in `_config.yml`

### Adding New Collections
1. Add collection to `_config.yml`
2. Create directory `_collection-name/`
3. Add default layout in `_config.yml`
4. Create layout file in `_layouts/`

## 📊 Analytics and SEO

### Built-in Features
- SEO optimization with `jekyll-seo-tag`
- Sitemap generation with `jekyll-sitemap`
- RSS feed with `jekyll-feed`
- Archive pages with `jekyll-archives`

### GitHub Pages Compatibility
- All plugins are GitHub Pages compatible
- Automatic deployment on push to main branch
- Custom domain support available

## 🔧 Development

### Local Development Commands

```bash
# Serve with drafts
bundle exec jekyll serve --drafts

# Serve with live reload
bundle exec jekyll serve --livereload

# Build for production
bundle exec jekyll build

# Check for issues
bundle exec jekyll doctor
```

### Testing

```bash
# Test links and HTML
bundle exec htmlproofer ./_site --disable-external

# Validate markup
bundle exec jekyll build && bundle exec htmlproofer ./_site
```

## 📚 Resources

### Jekyll Documentation
- [Jekyll Docs](https://jekyllrb.com/docs/)
- [Liquid Template Language](https://shopify.github.io/liquid/)
- [GitHub Pages Docs](https://docs.github.com/en/pages)

### Prompt Engineering Resources
- [OpenAI Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)
- [Anthropic Prompt Engineering](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Prompt Engineering Institute](https://www.promptengineering.org/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Jekyll](https://jekyllrb.com/)
- Styled with [Minima](https://github.com/jekyll/minima) theme
- Hosted on [GitHub Pages](https://pages.github.com/)
- Inspired by the prompt engineering community

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/your-username/prompt-engineering-tips/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-username/prompt-engineering-tips/discussions)
- **Contributing**: See [Contributing Guide](contributing.md)

---

**Ready to improve your prompting skills?** Start exploring our [Featured Prompts](/prompts/) or dive into the [Fundamentals Guide](/guides/fundamentals/)! 