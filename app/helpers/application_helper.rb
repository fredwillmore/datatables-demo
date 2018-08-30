module ApplicationHelper

  def card_header(icon_class = nil, text = '', collapse_selector = nil, control_links = nil, options = {})
    render partial: 'layouts/card_header', locals: {
      icon_class: icon_class,
      text: text,
      collapse_selector: collapse_selector,
      control_links: control_links || [],
      header_class: options[:header_class] || :primary,
      link_separator: options[:link_separator] || '&nbsp;',
    }
  end

  def display_icon(icon_class)
    octicon icon_class, height: 25, class: "left", :"aria-label" => "hi", fill: 'white'
  end

  def present(object, klass = nil)
    klass ||= presenter_class
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

end
