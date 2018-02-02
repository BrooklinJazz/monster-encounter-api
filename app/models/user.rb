class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validate email, must be unique and exist in a strict format
  validates :email, presence: true, uniqueness: true, format:VALID_EMAIL_REGEX
  # validate first and last name to exist
  validates :first_name, :last_name, presence: true

  has_secure_password
end
