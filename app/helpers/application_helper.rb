module ApplicationHelper
  def welcome_message
    return unless logged_in?
    I18n.t('welcome', username: current_user.username)
  end

  def logout_link
    return unless logged_in?
    link_to I18n.t('logout'), log_out_path
  end 
end
