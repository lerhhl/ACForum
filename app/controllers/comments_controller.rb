class CommentsController < ApplicationController
before_action :set_comment, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end

  def create
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)
    redirect_to topics_url(@comment)
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