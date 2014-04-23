class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end

  def self.authentication(email, password)
    user = User.find_by_email(email)
    if user && Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password
      return user
    end
    false
  end

  private
  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt, self.hashed_password =
        salt, Digest::SHA256.hexdigest(pass + salt)
  end
end