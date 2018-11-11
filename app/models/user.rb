class User < ApplicationRecord
  #rails added when we "g resource" and used "digest" as the data type for password
  # this helper method uses the bcrypt gem.  bcrypt needs to be uncommented in the gem file and bundle installed
  has_secure_password

  validates :name, presence: true
  # regex expression: S+ == non-whitespace character
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
end
