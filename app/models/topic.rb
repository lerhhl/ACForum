class Topic < ApplicationRecord
  default_scope { order(updated_at: :desc)  }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :topic_tags, dependent: :destroy

  validates :title, :body, :user_id, :status, presence: true 

  enum status: {
    "Draft":        1,
    "Published":    2,
    "Abandoned":    3,
  }

  attr_accessor :tagstring

  def set_tag_id(tagstring)
    tagstring.downcase!
    tag_arr = tagstring.split("#")
    
    tag_arr.each do |tag|
      if !Tag.exists?(:name => tag)
        cur_tag = Tag.create(:name => tag)
      else
        cur_tag = Tag.find_by(:name => tag)
      end
      TopicTag.create(:topic_id => self.id, :tag_id => cur_tag.id)
    end
  end

end
