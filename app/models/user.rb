class User < ActiveRecord::Base
  attr_reader :password

  validates :password_digest, presence: true
  validates :email, :session_token, presence: true, uniqueness: true
  validate :generate_session_token, :ensure_session_token,
                                    :reset_session_token!

  def self.generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)

  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password? password
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
