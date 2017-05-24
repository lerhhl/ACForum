class CommentsController < ApplicationController
before_action :set_comment, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.votes = 0
    if @comment.save
      redirect_to topic_path(@topic)
    else
      render :new
    end    
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to topic_url(@comment.topic_id)
  end

  def destroy
    @comment.destroy
    redirect_to topics_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end