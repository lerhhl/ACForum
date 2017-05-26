class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :topic_tags, dependent: :destroy
  has_many :tags, :through => :topic_tags
  
  validates :title, :body, :user_id, :status, presence: true 

  enum status: {
    "Draft":        1,
    "Published":    2,
    "Abandoned":    3,
  }

  # Scopes
  scope :published_topics, -> {where(status: 2)}
  scope :draft_topics, -> {where(status: 1)}

  #attr_accessor :tagstring

  def set_tag_id(tagstring)
    tagstring.downcase!
    tag_arr = tagstring.split("#")
    
    tag_arr.each do |tag|
      if !Tag.exists?(:name => tag)
        cur_tag = Tag.create(:name => tag, :topics_count => 0)
      else
        cur_tag = Tag.find_by(:name => tag)
      end
      if !TopicTag.exists?(:topic_id => self.id, :tag_id => cur_tag.id)
        TopicTag.create(:topic_id => self.id, :tag_id => cur_tag.id)
      end
    end
  end

  # Search
  def self.searchtitle(search)
    published_topics.where("title LIKE ?", "%#{search}%").pluck(:id)
  end
  
  def self.searchbody(search)
    published_topics.where("body LIKE ?", "%#{search}%").pluck(:id)
  end

end
