module SessionsHelper
  def ensure_current_user
    redirect_to new_session_url if current_user.nil?
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def logged_in?
    return false if current_user.nil?
    current_user.session_token == session[:session_token]
  end
  
  def send_email
    UserMailer.reset_password_email(@user).deliver
  end
  
end
