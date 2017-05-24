class ProfileController < ApplicationController
  
  def index
    @topics = Topic.where(user_id: current_user.id)
    @comments = Comment.where(user_id: current_user.id)
  end

  def edit
    @profile = current_user
  end


end