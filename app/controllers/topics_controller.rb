class TopicsController < ApplicationController
before_action :set_topic, :only => [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = set_topic
  #default = display recent topic/comments
  #display search result
  end

  def new
    @topic = Topic.new
  end

  def create
  #user_id = current_user.id
    @topic = Topic.new(topic_params)
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
    @topic.update_attributes(topic_params)
    redirect_to topics_url(@topic)
  end

  def destroy
    @topic.destroy
		redirect_to topics_url
  end
  

private

  def topic_params
    params.require(:topic).permit(:title, :body, :user_id)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end
  

end

