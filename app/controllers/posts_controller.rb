class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.links.new(params[:links].values)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
end
