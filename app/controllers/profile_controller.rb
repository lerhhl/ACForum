class ProfileController < ApplicationController

# User needs to login before doing the following actions
  before_action :authenticate_user!, only: [:index]

  def index
    @topics = Topic.where(user_id: current_user.id)
    @comments = Comment.where(user_id: current_user.id)
  end

end