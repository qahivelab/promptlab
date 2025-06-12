---
layout: page
title: "Prompts"
permalink: /prompts/
---

# Prompt Collection

A curated collection of high-quality prompts for various AI tools and use cases. Each prompt is tested, documented, and ready to use.

## 🚀 Featured Prompts

{% if site.prompts.size == 0 %}
<div class="empty-state">
  <p>No prompts have been added yet. <a href="/contributing/">Contribute</a> to add your favorite prompts!</p>
</div>
{% else %}
<div class="prompts-grid">
  {% for prompt in site.prompts %}
  <div class="prompt-card">
    <h3><a href="{{ prompt.url }}">{{ prompt.title }}</a></h3>
    
    {% if prompt.description %}
      <p class="prompt-description">{{ prompt.description }}</p>
    {% endif %}
    
    <div class="prompt-meta">
      {% if prompt.tool %}
        <span class="tool-badge">{{ prompt.tool }}</span>
      {% endif %}
      
      {% if prompt.use_case %}
        <span class="use-case-badge">{{ prompt.use_case }}</span>
      {% endif %}
      
      {% if prompt.complexity %}
        <span class="complexity-badge complexity-{{ prompt.complexity | downcase }}">
          {{ prompt.complexity }}
        </span>
      {% endif %}
      
      {% if prompt.date %}
        <span class="date">📅 {{ prompt.date | date: "%b %d, %Y" }}</span>
      {% endif %}
    </div>
    
    {% if prompt.tags %}
      <div class="prompt-tags">
        {% for tag in prompt.tags limit:3 %}
          <span class="tag">{{ tag }}</span>
        {% endfor %}
        {% if prompt.tags.size > 3 %}
          <span class="tag-more">+{{ prompt.tags.size | minus: 3 }} more</span>
        {% endif %}
      </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endif %}

## 📂 Browse by Category

### 🛠️ Development & Coding
Prompts for software development, debugging, and code generation.

{% assign dev_prompts = site.prompts | where: "category", "Development" %}
{% if dev_prompts.size > 0 %}
<ul class="category-list">
  {% for prompt in dev_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a> - {{ prompt.description | truncate: 100 }}</li>
  {% endfor %}
</ul>
{% else %}
- **[UI Automation Template](/prompts/ui-automation-template/)** - Comprehensive Playwright automation with Cursor
- **[QA Automation Engineer](/prompts/qa-automation-engineer/)** - Structured approach to test development
- **[Cursor Incremental Development](/prompts/cursor-incremental-development/)** - Phase-based development methodology
{% endif %}

### 🧪 Testing & QA
Prompts for quality assurance, testing strategies, and automation.

{% assign qa_prompts = site.prompts | where: "category", "Testing" %}
{% if qa_prompts.size > 0 %}
<ul class="category-list">
  {% for prompt in qa_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a> - {{ prompt.description | truncate: 100 }}</li>
  {% endfor %}
</ul>
{% else %}
- **Test Case Generation** - Create comprehensive test scenarios
- **Bug Report Analysis** - Systematic bug investigation and reporting
- **Automation Strategy** - Planning and implementing test automation
{% endif %}

### 📝 Content & Writing
Prompts for content creation, documentation, and communication.

{% assign content_prompts = site.prompts | where: "category", "Content" %}
{% if content_prompts.size > 0 %}
<ul class="category-list">
  {% for prompt in content_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a> - {{ prompt.description | truncate: 100 }}</li>
  {% endfor %}
</ul>
{% else %}
- **Technical Documentation** - Create clear, comprehensive documentation
- **Blog Post Generation** - Structured content creation
- **Marketing Copy** - Persuasive content templates
{% endif %}

### 📊 Data & Analysis
Prompts for data processing, analysis, and insights generation.

{% assign data_prompts = site.prompts | where: "category", "Data" %}
{% if data_prompts.size > 0 %}
<ul class="category-list">
  {% for prompt in data_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a> - {{ prompt.description | truncate: 100 }}</li>
  {% endfor %}
</ul>
{% else %}
- **Data Analysis** - Systematic data exploration and insights
- **Report Generation** - Structured reporting templates
- **Research Synthesis** - Combining multiple data sources
{% endif %}

## 🏷️ Browse by Tool

### Cursor
{% assign cursor_prompts = site.prompts | where: "tool", "Cursor" %}
{% if cursor_prompts.size > 0 %}
<ul class="tool-list">
  {% for prompt in cursor_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- **[UI Automation Template](/prompts/ui-automation-template/)**
- **[Incremental Development](/prompts/cursor-incremental-development/)**
{% endif %}

### ChatGPT
{% assign chatgpt_prompts = site.prompts | where: "tool", "ChatGPT" %}
{% if chatgpt_prompts.size > 0 %}
<ul class="tool-list">
  {% for prompt in chatgpt_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- **System Message Templates** - Role-based prompting setups
- **Chain of Thought** - Step-by-step reasoning prompts
- **Few-Shot Learning** - Example-driven prompts
{% endif %}

### Playwright
{% assign playwright_prompts = site.prompts | where: "tool", "Playwright" %}
{% if playwright_prompts.size > 0 %}
<ul class="tool-list">
  {% for prompt in playwright_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- **[UI Automation Template](/prompts/ui-automation-template/)**
- **Test Generation** - Automated test creation
- **Page Object Patterns** - Structured test organization
{% endif %}

## 🎯 Browse by Complexity

### Beginner
Perfect for those new to prompt engineering.

{% assign beginner_prompts = site.prompts | where: "complexity", "Beginner" %}
{% if beginner_prompts.size > 0 %}
<ul class="complexity-list">
  {% for prompt in beginner_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- Simple, direct prompts with clear instructions
- Basic templates for common tasks
- Step-by-step guidance included
{% endif %}

### Intermediate
For users comfortable with basic prompting concepts.

{% assign intermediate_prompts = site.prompts | where: "complexity", "Intermediate" %}
{% if intermediate_prompts.size > 0 %}
<ul class="complexity-list">
  {% for prompt in intermediate_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- **[QA Automation Engineer](/prompts/qa-automation-engineer/)**
- **[Cursor Incremental Development](/prompts/cursor-incremental-development/)**
- Multi-step processes with context management
{% endif %}

### Advanced
Complex prompts for experienced users.

{% assign advanced_prompts = site.prompts | where: "complexity", "Advanced" %}
{% if advanced_prompts.size > 0 %}
<ul class="complexity-list">
  {% for prompt in advanced_prompts %}
  <li><a href="{{ prompt.url }}">{{ prompt.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- **[UI Automation Template](/prompts/ui-automation-template/)**
- Chain-of-thought reasoning
- Multi-modal and context-heavy prompts
{% endif %}

## 💡 Quick Start Guide

### 1. Choose Your Tool
Start by selecting prompts designed for your preferred AI tool (ChatGPT, Cursor, Claude, etc.).

### 2. Pick Your Use Case
Browse by category to find prompts that match your specific needs.

### 3. Customize the Template
Replace placeholder text with your specific requirements and context.

### 4. Test and Iterate
Try the prompt and refine it based on the results you get.

### 5. Share Your Success
If you create a great variation, consider [contributing it back](/contributing/) to help others!

## 🔗 Related Resources

- **[Cookbook](/cookbook/)** - Quick reference and recipe collection
- **[Guides](/guides/)** - In-depth prompting techniques and strategies
- **[Tools](/tools/)** - Platform-specific tips and best practices
- **[Contributing](/contributing/)** - Add your own prompts to the collection

## 📈 Latest Additions

{% assign recent_prompts = site.prompts | sort: 'date' | reverse | limit: 5 %}
{% if recent_prompts.size > 0 %}
<ul class="recent-list">
  {% for prompt in recent_prompts %}
  <li>
    <a href="{{ prompt.url }}">{{ prompt.title }}</a>
    <span class="date">{{ prompt.date | date: "%b %d, %Y" }}</span>
  </li>
  {% endfor %}
</ul>
{% else %}
- **[UI Automation Template](/prompts/ui-automation-template/)** - Mar 22, 2024
- **[QA Automation Engineer](/prompts/qa-automation-engineer/)** - Mar 22, 2024
- **[Cursor Incremental Development](/prompts/cursor-incremental-development/)** - Mar 22, 2024
{% endif %}

---

**Can't find what you're looking for?** Check out our [Cookbook](/cookbook/) for more templates, or [contribute](/contributing/) your own prompts to help grow the collection! 