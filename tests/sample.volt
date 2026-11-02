{% extends 'templates/base.volt' %}
{# comment #}
{% block content %}
  {% for key, item in items if item.active %}
    <p class="x">{{ loop.index }} {{ item.name|e }} {{ "a #{b}" }}</p>
  {% elsefor %}
    {{ partial('partials/empty', ['k': 1]) }}
  {% endfor %}
  {% if a == 1 %}{{ link_to('x', 'y') }}{% elseif b %}{% else %}{% endif %}
  {% set x = [1, 2] %}
  {% switch x %}{% case 1 %}{% break %}{% default %}{% endswitch %}
{% endblock %}
