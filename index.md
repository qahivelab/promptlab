---
layout: default
title: "PromptLab"
---

<div class="hero-section">
  <h1 class="hero-title">PromptLab</h1>
  <p class="hero-description">Your experimental lab for prompt engineering techniques, templates, and best practices. Test, refine, and discover powerful prompts for AI tools.</p>
  
  <div class="cta-buttons">
    <a href="{{ "/prompts/" | relative_url }}" class="cta-primary">Browse Prompts</a>
    <a href="{{ "/guides/" | relative_url }}" class="cta-secondary">Learn Fundamentals</a>
  </div>
</div>

<div class="features-section">
  <div class="features-grid">
    <a href="{{ "/prompts/" | relative_url }}" class="feature-card">
      <div class="feature-icon">🎯</div>
      <h3 class="feature-title">Prompt Templates</h3>
      <p class="feature-description">Ready-to-use prompts for code generation, content creation, data analysis, and creative writing.</p>
    </a>
    
    <a href="{{ "/tools/" | relative_url }}" class="feature-card">
      <div class="feature-icon">🛠️</div>
      <h3 class="feature-title">Tool-Specific Guides</h3>
      <p class="feature-description">Optimized prompts for ChatGPT, Claude, GitHub Copilot, MidJourney, and more AI platforms.</p>
    </a>
    
    <a href="{{ "/guides/" | relative_url }}" class="feature-card">
      <div class="feature-icon">📚</div>
      <h3 class="feature-title">Best Practices</h3>
      <p class="feature-description">Learn prompt structure, context management, chain-of-thought reasoning, and few-shot techniques.</p>
    </a>
    
    <a href="{{ "/cookbook/" | relative_url }}" class="feature-card">
      <div class="feature-icon">🍳</div>
      <h3 class="feature-title">Prompt Cookbook</h3>
      <p class="feature-description">Organized examples and recipes categorized by scenario and use case.</p>
    </a>
  </div>
</div>

## 🚀 Quick Navigation

<div class="tools-grid">
  <div class="tool-card">
    <h3><a href="{{ "/prompts/" | relative_url }}">Featured Prompts</a></h3>
    <p>Curated collection of effective prompts for various AI tools and use cases.</p>
    <div class="tool-meta">
      <span class="use-case-badge">Templates</span>
      <span class="complexity-beginner">All Levels</span>
    </div>
  </div>
  
  <div class="tool-card">
    <h3><a href="{{ "/tools/" | relative_url }}">AI Tools</a></h3>
    <p>Platform-specific prompt guides and tool reviews for better AI interactions.</p>
    <div class="tool-meta">
      <span class="tool-badge">Guides</span>
      <span class="pricing-free">Free & Paid</span>
    </div>
  </div>
  
  <div class="tool-card">
    <h3><a href="{{ "/guides/" | relative_url }}">Learning Guides</a></h3>
    <p>Master prompt engineering fundamentals with comprehensive tutorials.</p>
    <div class="tool-meta">
      <span class="use-case-badge">Education</span>
      <span class="difficulty-beginner">Beginner Friendly</span>
    </div>
  </div>
  
  <div class="tool-card">
    <h3><a href="{{ "/cookbook/" | relative_url }}">Prompt Cookbook</a></h3>
    <p>Examples and recipes organized by scenario for quick reference.</p>
    <div class="tool-meta">
      <span class="use-case-badge">Recipes</span>
      <span class="complexity-intermediate">Organized</span>
    </div>
  </div>
</div>

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Add New Prompts** - Share your effective prompts
2. **Improve Documentation** - Help make guides clearer
3. **Report Issues** - Found a broken prompt? Let us know
4. **Suggest Features** - Ideas for new categories or tools

See our [Contributing Guide](/contributing/) for details.

## 📚 Recent Additions

<ul class="recent-list">
{% for prompt in site.prompts limit:5 %}
  <li>
    <a href="{{ prompt.url | relative_url }}">{{ prompt.title }}</a>
    <span class="date">{{ prompt.date | date: "%b %d, %Y" }}</span>
  </li>
{% endfor %}
</ul>

## 🏷️ Popular Categories

<div class="category-list">
  <ul>
    <li><strong>UI Automation</strong> - Templates for automating user interface testing</li>
    <li><strong>QA Testing</strong> - Quality assurance and testing prompts</li>
    <li><strong>Development</strong> - Code generation and development assistance</li>
    <li><strong>Documentation</strong> - Technical writing and documentation</li>
  </ul>
</div>

---

**Ready to improve your prompting skills?** Start with our [Prompting Fundamentals]({{ "/guides/prompting-fundamentals/" | relative_url }}) guide! 