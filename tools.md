---
layout: page
title: "Tools"
permalink: /tools/
---

# AI Tools & Platforms

A comprehensive guide to AI tools and platforms with specific prompting tips and best practices for each.

## 🛠️ Code Assistants

<div class="tools-grid">
{% for tool in site.tools %}
  {% if tool.category == "Code Assistant" %}
  <div class="tool-card">
    <h3><a href="{{ tool.url }}">{{ tool.title }}</a></h3>
    <p>{{ tool.description }}</p>
    <div class="tool-meta">
      <span class="pricing-badge pricing-{{ tool.pricing | downcase }}">{{ tool.pricing }}</span>
      {% if tool.website %}
        <a href="{{ tool.website }}" target="_blank" class="website-link">Visit</a>
      {% endif %}
    </div>
  </div>
  {% endif %}
{% endfor %}
</div>

## 🎨 Image Generation

<div class="tools-grid">
{% for tool in site.tools %}
  {% if tool.category == "Image Generation" %}
  <div class="tool-card">
    <h3><a href="{{ tool.url }}">{{ tool.title }}</a></h3>
    <p>{{ tool.description }}</p>
    <div class="tool-meta">
      <span class="pricing-badge pricing-{{ tool.pricing | downcase }}">{{ tool.pricing }}</span>
      {% if tool.website %}
        <a href="{{ tool.website }}" target="_blank" class="website-link">Visit</a>
      {% endif %}
    </div>
  </div>
  {% endif %}
{% endfor %}
</div>

## 🤖 AI Assistants

<div class="tools-grid">
{% for tool in site.tools %}
  {% if tool.category == "AI Assistant" %}
  <div class="tool-card">
    <h3><a href="{{ tool.url }}">{{ tool.title }}</a></h3>
    <p>{{ tool.description }}</p>
    <div class="tool-meta">
      <span class="pricing-badge pricing-{{ tool.pricing | downcase }}">{{ tool.pricing }}</span>
      {% if tool.website %}
        <a href="{{ tool.website }}" target="_blank" class="website-link">Visit</a>
      {% endif %}
    </div>
  </div>
  {% endif %}
{% endfor %}
</div>

## 📝 Writing & Content

<div class="tools-grid">
{% for tool in site.tools %}
  {% if tool.category == "Writing Assistant" %}
  <div class="tool-card">
    <h3><a href="{{ tool.url }}">{{ tool.title }}</a></h3>
    <p>{{ tool.description }}</p>
    <div class="tool-meta">
      <span class="pricing-badge pricing-{{ tool.pricing | downcase }}">{{ tool.pricing }}</span>
      {% if tool.website %}
        <a href="{{ tool.website }}" target="_blank" class="website-link">Visit</a>
      {% endif %}
    </div>
  </div>
  {% endif %}
{% endfor %}
</div>

## All Tools

{% if site.tools.size == 0 %}
<p>No tools have been added yet. <a href="/contributing/">Contribute</a> to add your favorite AI tools!</p>
{% else %}
<div class="tools-list">
  {% for tool in site.tools %}
  <div class="tool-item">
    <h3><a href="{{ tool.url }}">{{ tool.title }}</a></h3>
    <p>{{ tool.description }}</p>
    <div class="tool-tags">
      {% for tag in tool.tags %}
        <span class="tag">{{ tag }}</span>
      {% endfor %}
    </div>
  </div>
  {% endfor %}
</div>
{% endif %}

## 💡 General Prompting Tips

### Universal Best Practices
- **Be Specific**: Clearly define what you want to achieve
- **Provide Context**: Include relevant background information
- **Set Constraints**: Specify limitations, format, or style requirements
- **Use Examples**: Show the desired output format when possible
- **Iterate**: Refine your prompts based on results

### Tool-Specific Considerations
- **Code Assistants**: Include programming language, framework, and architecture details
- **Image Generation**: Specify style, composition, lighting, and technical parameters
- **Writing Tools**: Define audience, tone, length, and purpose
- **AI Assistants**: Structure requests with clear sections and deliverables

## 🔗 Related Resources

- **[Prompt Cookbook](/cookbook/)** - Ready-to-use prompt templates
- **[Fundamentals Guide](/guides/fundamentals/)** - Learn prompt engineering basics
- **[Featured Prompts](/prompts/)** - Browse our prompt collection
- **[Contributing](/contributing/)** - Add new tools and prompts

---

**Missing a tool?** Help us expand this collection by [contributing](/contributing/) your favorite AI tools and prompting strategies! 