module Authentification
  def self.local_login params
    return unless params[:username] || params[:password]
    user = User.find_by(username: params[:username])
    if user && user.password_hash.eql?(user.generate_hash(params[:password]))
      user
    else
      nil
    end
  end
end