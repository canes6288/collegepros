class User < ActiveRecord::Base

  before_save { email.downcase! }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 254 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 254 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password


  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::MD5.hexdigest(token.to_s)
  end

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
