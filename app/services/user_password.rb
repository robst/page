# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class UserPassword
  def self.generate_hash user
    BCrypt::Engine.hash_secret(user.password, user.password_salt)
  end
  
  def self.generate_salt
    BCrypt::Engine.generate_salt
  end
end
