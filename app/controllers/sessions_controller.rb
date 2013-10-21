class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user])
    if !!@user
      login(@user)
      render :json => @user
      # redirect_to posts_url
    else
      flash.now[:errors] = "email/password combo was incorrect!"
      @user = User.new
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to new_session_url
  end
end
