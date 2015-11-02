class User < ActiveRecord::Base
  attr_accessor :password
  
  before_save :encrypt_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, confirmation: true

  def self.authenticate(username, password)
    user = find_by(username: username)
    if user && user.password_hash.eql?(user.generate_hash(password))
      user
    else
      nil
    end
  end

  def generate_hash plain
    BCrypt::Engine.hash_secret(plain, password_salt)
  end

private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = generate_hash password
    end
  end
end
