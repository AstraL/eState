module Administrator::BaseHelper

  def mdi_icon(icon, options={})
    icon_class = 'mdi-' + icon

    content_tag(:i, '', options, class: icon_class)
  end
end
