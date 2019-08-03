class User < ApplicationRecord

  has_many :user_events
  has_many :events, through: :user_events

  #before_save :encrypt_password
  before_save {self.email = email.downcase}
  before_save {self.first_name = first_name.capitalize}
  before_save {self.last_name = last_name.capitalize}
  #after_save :clear_password

  #validating the attributes on users table

  validates :first_name, presence: true, length: {minimum: 3, maximum: 25}

  validates :last_name, presence: true, length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 120},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }



  has_secure_password
  validates :password, :confirmation => true, #password_confirmation attr
            presence: true, length: { minimum: 6 }, allow_nil: true


end