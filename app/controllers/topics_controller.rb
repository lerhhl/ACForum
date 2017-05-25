class TopicsController < ApplicationController
  
  # Find params before the following actions
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # User needs to login before doing the following actions
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    # @topics = Topic.page(params[:page]).per(10)

    if params[:tag] != nil && params[:tag] != ""
      @tag = Tag.find(params[:tag])
      @topic_list = @tag.topics.where(status: 2)
    else
      @topic_list = Topic.where(status: 2)
    end

    # Search Controller
    if params[:search]
      # Get topic ids array from search
      @topics_id = @topic_list.searchtitle(params[:search]).pluck(:id)
      @topics_id += @topic_list.searchbody(params[:search]).pluck(:id)
      @topics_id.uniq!
      @topics = Topic.where('id IN (?)', @topics_id)
      if params[:sort]
        sortstring = params[:sort] + params[:sorttype]
        @topics = @topics.order(sortstring)
      else
        @topics = @topics.order('created_at DESC')
      end
      @topics = @topics.page(params[:page]).per(10)

    else
      # Sort Controller
      if params[:sort]
        sortstring = params[:sort] + params[:sorttype]
        @topics = @topic_list
        @topics = @topics.order(sortstring).page(params[:page]).per(10)
      else
        @topics = @topic_list.order('created_at DESC').page(params[:page]).per(10)
      end
    end

    # Tags
    @taglist = {}
    @topics.each do |topic|
      topic.tags.each do |tagname|
        if !@taglist.keys.include?(tagname.id)
          @taglist[tagname.id] = 1
        else
          @taglist[tagname.id] += 1
        end
      end
    end
    @taglist = @taglist.sort_by { |k, v| v }.reverse.first(10)



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
    @topic.view_counts = 0
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

  def about
    @total_pageviews = 0
    @total_votes = 0
    Topic.all.each do |topic|
      @total_pageviews += topic.view_counts
      @total_votes += topic.votes
    end
    

  end
  

private

  def topic_params
    params.require(:topic).permit(:title, :body, :tagstring, :user_id, :status)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end

end

