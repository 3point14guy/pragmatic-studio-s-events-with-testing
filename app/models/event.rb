class Event < ApplicationRecord
  def free?
    # price == 0
    price.blank? || price.zero?
  end

# this is a class level method that acts on the class and not an instance of the class so we use "self" in the method name
  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end
end
