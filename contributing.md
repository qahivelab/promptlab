---
layout: page
title: "Contributing Guide"
permalink: /contributing/
---

# Contributing to Prompt Engineering Tips Repository

Thank you for your interest in contributing! This repository thrives on community contributions. Here's how you can help make it better.

## 🤝 Ways to Contribute

### 1. Add New Prompts
Share your effective prompts that others can benefit from.

### 2. Improve Documentation
Help make guides clearer and more comprehensive.

### 3. Report Issues
Found a broken prompt or unclear instructions? Let us know!

### 4. Suggest Features
Ideas for new categories, tools, or improvements.

## 📝 Adding a New Prompt

### Step 1: Create the File
Create a new file in the `_prompts` directory with a descriptive name:
```
_prompts/your-prompt-name.md
```

### Step 2: Add Front Matter
Use this template for the YAML front matter:

```yaml
---
title: "Your Prompt Title"
description: "Brief description of what this prompt does"
tool: "Tool Name (e.g., ChatGPT, Claude, Cursor)"
use_case: "Use Case Category (e.g., Code Generation, Testing, Writing)"
complexity: "Beginner/Intermediate/Advanced"
tags:
  - tag1
  - tag2
  - tag3
date: YYYY-MM-DD
prompt: |
  Your actual prompt text here.
  Can be multiple lines.
  Use proper formatting.
example_input: |
  Example of how to use this prompt (optional)
example_output: |
  Example of expected output (optional)
tips:
  - "Helpful tip 1"
  - "Helpful tip 2"
variations:
  - name: "Variation Name"
    prompt: |
      Modified version of the prompt
    description: "When to use this variation"
---
```

### Step 3: Add Content
Below the front matter, add detailed explanation, usage instructions, and best practices.

## 📚 Adding a Guide

### Step 1: Create the File
Create a new file in the `_guides` directory:
```
_guides/your-guide-name.md
```

### Step 2: Use Guide Template
```yaml
---
title: "Your Guide Title"
description: "What this guide covers"
difficulty: "Beginner/Intermediate/Advanced"
reading_time: 5
tags:
  - guide-tag1
  - guide-tag2
date: YYYY-MM-DD
related_prompts:
  - prompt-slug-1
  - prompt-slug-2
---
```

## 🛠️ Adding Tool Information

### Step 1: Create Tool File
Create a new file in the `_tools` directory:
```
_tools/tool-name.md
```

### Step 2: Tool Template
```yaml
---
title: "Tool Name"
description: "Brief description of the tool"
website: "https://tool-website.com"
category: "AI Assistant/Image Generation/Code Assistant"
pricing: "Free/Paid/Freemium"
tags:
  - tool-tag1
  - tool-tag2
date: YYYY-MM-DD
---
```

## ✅ Quality Guidelines

### For Prompts
- **Test your prompts** before submitting
- **Include context** about when and how to use them
- **Provide examples** when possible
- **Use clear, specific language**
- **Add relevant tags** for discoverability

### For Guides
- **Structure content logically** with clear headings
- **Include practical examples**
- **Link to related prompts** when relevant
- **Keep language accessible** to your target audience

### For All Content
- **Use proper markdown formatting**
- **Check spelling and grammar**
- **Follow existing naming conventions**
- **Include appropriate metadata**

## 🔄 Submission Process

### Option 1: GitHub (Recommended)
1. Fork the repository
2. Create a new branch for your contribution
3. Add your content following the guidelines above
4. Submit a pull request with a clear description

### Option 2: Issue Submission
If you're not comfortable with Git:
1. Create a new issue
2. Use the "Content Submission" template
3. Include all your content in the issue description
4. We'll help format and add it to the repository

## 📋 Pull Request Checklist

Before submitting your PR, ensure:

- [ ] Content follows the appropriate template
- [ ] All required front matter fields are included
- [ ] Markdown formatting is correct
- [ ] Links work properly
- [ ] Content is original or properly attributed
- [ ] Tags are relevant and follow existing conventions
- [ ] Examples are tested and work as expected

## 🏷️ Tagging Guidelines

### Use Consistent Tags
- **Tools**: `chatgpt`, `claude`, `cursor`, `midjourney`, etc.
- **Use Cases**: `code-generation`, `testing`, `writing`, `debugging`, etc.
- **Complexity**: `beginner`, `intermediate`, `advanced`
- **Domains**: `web-development`, `data-science`, `design`, etc.

### Tag Naming
- Use lowercase
- Use hyphens for multi-word tags
- Be specific but not overly granular
- Check existing tags before creating new ones

## 🤔 Need Help?

- **Questions about contributing?** Open an issue with the "question" label
- **Not sure about formatting?** Look at existing content for examples
- **Want to discuss a major change?** Open an issue first to get feedback

## 📜 Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and improve
- Give credit where credit is due
- Focus on the content, not the contributor

## 🎉 Recognition

Contributors will be:
- Listed in our contributors section
- Credited in the content they create
- Mentioned in release notes for significant contributions

Thank you for helping make this repository a valuable resource for the community! 