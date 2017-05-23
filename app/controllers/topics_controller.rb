class TopicsController < ApplicationController
  
    def index
    end

    def show
        @topic = set_topic
    #default = display recent topic/comments
    #display search result
    end

    private

    def topics_params
        params.require(:topic).permit(:title, :body, :status)
    end
    
    def set_comment
        @comment = Comment.find(params[:id])
    end
    
    def set_topic
        @topic = Topic.find(params[:id])
    end
end