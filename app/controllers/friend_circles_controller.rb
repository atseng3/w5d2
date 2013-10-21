class FriendCirclesController < ApplicationController
  before_filter :ensure_current_user
  
  def show
    @circle = FriendCircle.find(params[:id])
    render :show
  end
  
  def new
    @circle = FriendCircle.new
    render :new
  end
  
  def create
    @circle = FriendCircle.new(params[:circle])
    if @circle.save
      redirect_to user_url(@circle.owner_id)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end
end