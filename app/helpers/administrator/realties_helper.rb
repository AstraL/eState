module Administrator::RealtiesHelper

  def realty_status(realty)
    if realty.active
      icon = 'fa fa-check'
      color = 'text-success'
    else
      icon = 'fa fa-times'
      color = 'text-danger'
    end

    content_tag(:i,'', class: "#{icon} #{color}")
  end

  def realty_deal_badge(realty)
    content_tag(:span, realty.deal.name, class: "deal-badge #{realty.deal.slug}")
  end

end
