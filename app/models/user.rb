class User < ApplicationRecord

  #before_save :encrypt_password
  before_save {self.email = email.downcase}
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
            presence: true, length: { minimum: 6 }



 end