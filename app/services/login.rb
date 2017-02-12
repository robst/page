class Login
  include ActiveModel::Model
  include ActiveSupport::Callbacks
  include ActiveModel::Validations::Callbacks

  attr_accessor :username, :password

  validate :valid_user
  validate :valid_password

  def user
    @user ||= User.find_by(username: username)
  end

  def save
    valid?
  end

  private

  def valid_user
    return if user
    errors.add(:username, 'not found')      
  end

  def valid_password
    return if user && user.password_hash.eql?(UserPassword.generate_hash self)
    errors.add(:password, 'not valid')
  end

end
