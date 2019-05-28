module ApplicationHelper
  def highlight_search(text, term)
    return text if term.blank?
    text.gsub(/(#{term})/i, '<span style="background-color: yellow">\1</span>').html_safe
  end
end
