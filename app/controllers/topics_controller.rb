class TopicsController < ActionController::Base


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

private

  def topic_params
    params.require(:topic).permit(:title, :body, :user_id)
  end

  

end
