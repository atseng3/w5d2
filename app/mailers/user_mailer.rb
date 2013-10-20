class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def reset_password_email(user)
    @user = user
    password_token = @user.reset_password_token!
    @url = "/?password_token=#{password_token}"
    mail(to: user.email, subject: "This is your password reset email")
  end
end
