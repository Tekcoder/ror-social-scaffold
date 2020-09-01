class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def forward_request
    current_user.friendships.create(friend_id: params[:id])
    flash[:success] = "Sent Friend request"
    redirect_to root_path
  end

  def receive_request
    user = User.find(params[:id])
    current_user.confirm_friend(user)
    flash[:success] = "#{user.name} is now your friend"
    redirect_to root_path
  end
end
