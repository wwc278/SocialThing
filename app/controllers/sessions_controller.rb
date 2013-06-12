class SessionsController < ApplicationController
  include SessionsHelper

  def new
    if logged_in?
      redirect_to user_url(current_user.id)
      return
    end
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user.nil?
      render :new
      return
    end

    if @user.verify_password(params[:user][:password])
      @user.reset_session_token!
      session[:token] = @user.session_token
      redirect_to user_url(@user.id)
    else
      render :new
    end

  end

  def destroy
    u = current_user
    if u.nil?
      redirect_to new_session_url
      return
    end

    u.session_token = nil
    session[:token] = nil
    u.save!
    redirect_to new_session_url
  end
end
