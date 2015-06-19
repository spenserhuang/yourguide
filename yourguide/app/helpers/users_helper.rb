module UsersHelper
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

  def user_logged_in?
    session[:user_id] != nil
  end
end
