module EventsHelper
  def format_price(event)
    if event.free?
      content_tag(:strong, "Free")
    else
      number_to_currency(event.price)
    end
  end

  def image_for(event)
    if event.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag event.image_file_name
    end
  end

  def register_link(event)
    # if event.spots_left == 0
    if event.sold_out?
      content_tag(:strong, "Sold Out!")
    else
      link_to "Register", new_event_registration_path(event)
    end
  end
end
