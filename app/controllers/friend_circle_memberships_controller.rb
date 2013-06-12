class FriendCircleMembershipsController < ApplicationController

  include SessionsHelper
  def new
    @user = current_user
    @friends = @user.friends
    @all_users = User.all
  end

  def create
    @user = current_user
    @user.friend_ids = params[:friend_circle_membership][:friend_ids]
    redirect_to user_url(@user.id)
  end

  def show

  end

  def edit
    @all_users = User.all
    @group = FriendCircleMembership.find(params[:id])
    @user = current_user
    @friends = @user.friends
  end

  def update
    @user = current_user
    @user.friend_ids = params[:friend_circle_membership][:friend_ids]
    redirect_to user_url(@user.id)
  end

  def destroy

  end
end
