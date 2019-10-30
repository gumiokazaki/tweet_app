class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true
  validates :email, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, allow_blank: true

  def posts
    return Post.where(user_id: self.id)
  end
end
