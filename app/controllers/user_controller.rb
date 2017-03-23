class UserController < ApplicationController

  def show
    @users = User.all
    # @follow_status = user.follows?(celebrity) ? 'Unfollow' : 'Follow'
  end

  def toggle_follow
    @user_to_follow = User.find(params[:user_id])
    current_user.follow!(@user_to_follow)
    redirect_to :back
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def list_all_users

  end

end
