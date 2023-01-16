class User < ApplicationRecord
      has_many :JobApplication
      has_secure_password
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
      before_save { self.Email = self.Email.downcase }
      validates :Email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  end
  