---
layout: page
title: "Guides"
permalink: /guides/
---

# Prompt Engineering Guides

Comprehensive guides to help you master the art and science of prompt engineering across different domains and tools.

## 📚 Available Guides

{% if site.guides.size == 0 %}
<div class="empty-state">
  <p>No guides have been added yet. <a href="{{ "/contributing/" | relative_url }}">Contribute</a> to add your expertise!</p>
</div>
{% else %}
<div class="guides-grid">
  {% for guide in site.guides %}
  <div class="guide-card">
    <h3><a href="{{ guide.url | relative_url }}">{{ guide.title }}</a></h3>
    
    {% if guide.description %}
      <p class="guide-description">{{ guide.description }}</p>
    {% endif %}
    
    <div class="guide-meta">
      {% if guide.difficulty %}
        <span class="difficulty-badge difficulty-{{ guide.difficulty | downcase }}">
          {{ guide.difficulty }}
        </span>
      {% endif %}
      
      {% if guide.reading_time %}
        <span class="reading-time">📖 {{ guide.reading_time }} min</span>
      {% endif %}
      
      {% if guide.date %}
        <span class="date">📅 {{ guide.date | date: "%b %d, %Y" }}</span>
      {% endif %}
    </div>
    
    {% if guide.tags %}
      <div class="guide-tags">
        {% for tag in guide.tags limit:3 %}
          <span class="tag">{{ tag }}</span>
        {% endfor %}
        {% if guide.tags.size > 3 %}
          <span class="tag-more">+{{ guide.tags.size | minus: 3 }} more</span>
        {% endif %}
      </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endif %}

## 🎯 Guide Categories

### Fundamentals
Learn the core principles and techniques of effective prompt engineering.

- **[Prompting Fundamentals]({{ "/guides/fundamentals/" | relative_url }})** - Essential concepts and best practices
- **Prompt Structure** - How to organize and format effective prompts
- **Context Management** - Providing the right information for better results

### Domain-Specific Guides
Specialized techniques for different fields and applications.

- **Code Generation** - Prompts for software development and programming
- **Content Creation** - Writing, marketing, and creative content prompts
- **Data Analysis** - Prompts for research, analysis, and insights
- **Design & Creative** - Visual and creative project prompts

### Tool-Specific Guides
Master prompting for specific AI tools and platforms.

- **ChatGPT & GPT Models** - OpenAI-specific techniques and best practices
- **Claude** - Anthropic's AI assistant optimization
- **Cursor & Code Assistants** - Development-focused AI tools
- **Image Generation** - MidJourney, DALL-E, and Stable Diffusion

### Advanced Techniques
Sophisticated approaches for complex use cases.

- **Chain of Thought** - Step-by-step reasoning prompts
- **Few-Shot Learning** - Using examples to guide AI behavior
- **Role-Based Prompting** - Persona and character-driven approaches
- **Multi-Modal Prompting** - Combining text, images, and other inputs

## 💡 Quick Tips

### For Beginners
1. **Start Simple** - Begin with clear, direct requests
2. **Be Specific** - Include relevant details and context
3. **Iterate** - Refine your prompts based on results
4. **Learn from Examples** - Study successful prompts in our collection

### For Advanced Users
1. **Experiment with Structure** - Try different prompt formats
2. **Use System Messages** - Set context and behavior guidelines
3. **Chain Prompts** - Break complex tasks into steps
4. **Measure Results** - Track what works for your use cases

## 🔗 Related Resources

- **[Prompt Collection]({{ "/prompts/" | relative_url }})** - Browse ready-to-use prompts
- **[Tool Guides]({{ "/tools/" | relative_url }})** - Platform-specific prompting tips
- **[Cookbook]({{ "/cookbook/" | relative_url }})** - Quick reference and templates
- **[Contributing]({{ "/contributing/" | relative_url }})** - Share your knowledge

## 📖 Reading Path

New to prompt engineering? Follow this suggested reading order:

1. **[Fundamentals]({{ "/guides/fundamentals/" | relative_url }})** - Start here for core concepts
2. **[Tool-Specific Guides]({{ "/tools/" | relative_url }})** - Choose your preferred AI platform
3. **[Domain Guides](#domain-specific-guides)** - Focus on your area of interest
4. **[Advanced Techniques](#advanced-techniques)** - Expand your skills
5. **[Cookbook]({{ "/cookbook/" | relative_url }})** - Apply what you've learned

---

**Want to contribute?** We're always looking for new guides and improvements to existing ones. Check out our [Contributing Guide]({{ "/contributing/" | relative_url }}) to get started! 