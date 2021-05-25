class User < ApplicationRecord

  has_many :twitter_accounts
  has_many :tweets

  has_secure_password
  has_secure_token :password_reset_token

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

  def generate_token(user)
  	user = User.last
  	user.regenerate_password_reset_token

  	user.password_reset_token_created_at = Time.zone.now

  	user.save!
  end

  def find_by_token(token)
  	User.find_by(password_reset_token :token)
  end

  def find_by_token(token)
  	User.where("password_reset_token = ? AND password_reset_token_created_at >= ?", token, 15.minutes.ago).first
  end
end
   