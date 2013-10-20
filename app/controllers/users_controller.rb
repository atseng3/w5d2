class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      login
      render :json => @user
      # redirect_to posts_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def forgot
    @user = User.new
    render :forgot
  end
  
  def verify
    @user = User.find_by_email(params[:user][:email])
    if !!@user
      send_email
      render :json => @user
      # redirect_to root_url
    else
      flash[:errors] = "your email was not found, try again."
      render :forgot
    end
  end
  
  def reset_request
    @user = User.new
    render :reset_request
  end
  
  def reset
    @user = User.find_by_email(params[:user][:email])
    if !!@user
      @user.reset_password(params[:user][:password])
      login
      render :json => @user
      # redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :reset_request
    end
  end
end
