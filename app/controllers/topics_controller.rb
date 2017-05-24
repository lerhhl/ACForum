class TopicsController < ApplicationController
  
  # Find params before the following actions
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # User needs to login before doing the following actions
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  #default = display recent topic/comments
  #display search result
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.votes = 0
    if @topic.save
      tagstring = params[:topic][:tagstring]
      @topic.set_tag_id(tagstring)
      redirect_to topics_url
    else
      render :new
    end
  end


  def edit
  end

  def update
    @topic.update(topic_params)
    redirect_to topics_url(@topic)
  end

  def destroy
    @topic.destroy
		redirect_to topics_url
  end
  

private

  def topic_params
    params.require(:topic).permit(:title, :body, :tagstring, :user_id, :status)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end
  

end

