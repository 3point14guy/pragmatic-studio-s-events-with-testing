class User < ApplicationRecord
  #rails added when we "g resource" and used "digest" as the data type for password
  # this helper method uses the bcrypt gem.  bcrypt needs to be uncommented in the gem file and bundle installed
  has_secure_password

  validates :name, presence: true
  # regex expression: S+ == non-whitespace character
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
  # using self bc  this is a class level method
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    # the authenticate below is provided by rails through calling "has_secure_password" up above
    user && user.authenticate(password)
  end
end
