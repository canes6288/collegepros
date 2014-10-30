class User < ActiveRecord::Base

  has_and_belongs_to_many :players

  before_save { email.downcase! }
  before_create :create_remember_token
  after_create :send_welcome_message

  validates :phone, length: { is: 10 }
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

  def send_welcome_message
    unless self.phone == "9999999999"
      account_sid = "AC411dc2b8d69e4ffa1b5ec193a8c8cd94"
      auth_token = "71061710dc77ac139f1b9c0cd0170cde"
      client = Twilio::REST::Client.new account_sid, auth_token

      from = "+12392014618" # My Twilio number

      client.account.messages.create(
        :from => from,
        :to => self.phone,
        :body => "Hey #{self.name}, Welcome to CollegePros! Go #{self.school}!"
      )
    end
  end
end
