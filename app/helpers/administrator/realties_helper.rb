module Administrator::RealtiesHelper

  def realty_status(realty)
    if realty.active
      icon = 'ti-check'
      color = 'text-success'
    else
      icon = 'ti-close'
      color = 'text-danger'
    end

    content_tag(:i,'', class: "#{icon} #{color}")
  end

end
