class PostsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @friends = @user.friends
  end

  def create
    @user = User.find(params[:user_id])

    @post = Post.new(params[:post])
    #@post.user_id = params[:user_id]

    if @post.save
      flash[:notices] = "Post successfully saved!"
      redirect_to post_url(@post.id)
    else
      flash[:error] = "Post failed to save."
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show

  end
end
