class Event < ApplicationRecord
  def free?
    # price == 0
    price.blank? || price.zero?
  end
end
