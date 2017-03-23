class UsersController < ApplicationController
  before_action :set_user

  def toggle_follow
    current_user.follow!(@user)
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
