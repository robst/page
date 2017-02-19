# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class UserPassword
  def self.generate_hash password, salt
    BCrypt::Engine.hash_secret(password, salt)
  end

  def self.generate_hash_for user
    generate_hash user.password, user.password_salt
  end

  def self.generate_salt
    BCrypt::Engine.generate_salt
  end
end
