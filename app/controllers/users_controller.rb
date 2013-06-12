class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "User successfully saved."
      @user.reset_session_token!
      session[:token] = @user.session_token
      redirect_to user_url(@user.id)
    else
      flash[:error] = "User failed to save."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
