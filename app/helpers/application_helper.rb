module ApplicationHelper
  def welcome_message
    return unless current_user
    I18n.t('welcome', username: current_user.username)
  end
end
