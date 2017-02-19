class User < ApplicationRecord
  attr_accessor :password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, confirmation: true

  before_save :encrypt_password

private

  def encrypt_password
    if password.present?
      self.password_salt = UserPassword.generate_salt
      self.password_hash = UserPassword.generate_hash_for self
    end
  end
end
