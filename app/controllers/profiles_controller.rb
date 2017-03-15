class ProfilesController < ApplicationController
  def show
    @meows = current_user.meows
  end
end
