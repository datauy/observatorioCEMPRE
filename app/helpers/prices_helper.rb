module PricesHelper
  def format_price(price)
    result = '<div class="price-cell"><div class="price-head">'
    if price.value.present?
      result += "<b>#{price.value} USD</b>"
    end
    if price.min_value.present? || price.max_value.present?
      result += "<span>#{price.min_value.present? ? price.min_value.to_s+' USD' : ''} - #{price.max_value.present? ? price.max_value.to_s+' USD' : ''}</span>"
    end
    result += "</div>"
    if price.source.present? || price.description.present?
      result += '<div class="price-action">
      <button class="info-tooltip" onclick="loadTooltip(event)"><i class="fas fa-circle-info"></i></button>
      <div class="tooltip">'
      if price.description.present?
        result += "<b>#{price.description}</b>"
      end
      if price.source.present?
        result += "<span>Fuente: #{price.source}</span>"
      end
      if price.last_update.present?
        result += "<span>Actuallizado: #{price.last_update.strftime("%m/%d/%Y")}</span>"
      end
      result += "</div></div>"
    end
    result += "</div>"
    result.html_safe
  end
end
