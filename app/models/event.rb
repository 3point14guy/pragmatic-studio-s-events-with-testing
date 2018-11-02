class Event < ApplicationRecord
  # this tells the event model to expect an event_id column in the table wrapped by the registration model
  # dependent: :destroy tells active record to destroy all the child objects (registrations) in the database if the event is destroyed
  has_many :registrations, dependent: :destroy

  validates :name, :location, presence: true
  validates :description, length: {minimum: 25}
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :capacity, numericality: {only_integer: true, grater_than: 0}
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  def free?
    # price == 0
    price.blank? || price.zero?
  end

# this is a class level method that acts on the class and not an instance of the class so we use "self" in the method name
  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end
end
