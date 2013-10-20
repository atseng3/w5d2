module SessionsHelper
  
  
  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def login
    session[:session_token] = @user.reset_session_token!
  end
  
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def logged_in?
    !!current_user
  end
  
  def send_email
    UserMailer.reset_password_email(@user).deliver
  end
  
end
