class Registration < ApplicationRecord
  # this allows us to get and set the event object from our registrations object
  belongs_to :event

  validates :name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }

  HOW_HEARD_OPTIONS = [
    'Newsletter',
    'Blog Post',
    'Twitter',
    'Web Search',
    'Friend/Coworker',
    'Other'
  ]

  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }
end
